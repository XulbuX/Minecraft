from xulbux import Console, String, Regex
from pathlib import Path
import regex as rx
import random
import struct
import sys

SELECTOR = r"(?:\*|\@[aenprs]|[^\s]+)"
REGEX = {
    "hex": rx.compile(r"(#|0x)([0-9a-fA-F]{8}|[0-9a-fA-F]{6}|[0-9a-fA-F]{3,4})\b"),
    "nbt": rx.compile(
        r"(?<=(?:give\s+"
        + SELECTOR
        + r"\s+([\w_]+)\s*)|(?:nbt\s*=\s*))"
        + Regex.brackets("{", "}", is_group=True)
    ),
    "tag_usage": rx.compile(
        r"(?<=(?:"
        + SELECTOR
        + r"\s*\[.*?,?\s*tag\s*=\s*)|(?:tag\s+"
        + SELECTOR
        + r"\s+(?:add|remove)\s+))([\w+-._]+)"
    ),
    "team_usage": rx.compile(
        r"(?<=team\s+(?:add|empty|join|list|modify|remove)\s+)([\w+-._]+)"
    ),
    "scoreboard_usage": rx.compile(
        r"(?<=(?:score\s+"
        + SELECTOR
        + r"\s+)|(?:scoreboard\s+objectives\s+(?:add|modify|remove|setdisplay\s+[\w+-._]+)\s+)|(?:scoreboard\s+players\s+(?:add|display\s+(?:name|numberformat)\s+"
        + SELECTOR
        + rf"|enable\s+{SELECTOR}|get\s+{SELECTOR}|remove\s+{SELECTOR}|reset\s+{SELECTOR}|set\s+{SELECTOR})\s+))([\w+-._]+)"
    ),
    "scoreboard_operation": rx.compile(
        r"(?<=scoreboard\s+players\s+operation"
        + SELECTOR
        + r"\s+)([\w+-._]+)\s+([%*+-/<>=]+)\s+("
        + SELECTOR
        + r")\s+([\w+-._]+)"
    ),
    "unbreakable": rx.compile(r"Unbreakable\s*:\s*1"),
    "enchantment_glint": rx.compile(r"Enchantments\s*:\s*\[\s*\{\s*\}\s*\]"),
    "block_state_tag": rx.compile(
        r"BlockStateTag\s*:\s*" + Regex.brackets("{", "}", is_group=True)
    ),
    "damage": rx.compile(r"Damage\s*:\s*([0-9]+)"),
    "custom_model_data": rx.compile(r"CustomModelData\s*:\s*([0-9]+)"),
    "enchantments": rx.compile(
        r"Enchantments\s*:\s*\[\s*(?:"
        + Regex.brackets("{", "}", is_group=True)
        + r"\s*,?\s*)+\s*\]"
    ),
    "attribute_modifiers": rx.compile(
        r"AttributeModifiers\s*:\s*\[\s*(?:"
        + Regex.brackets("{", "}", is_group=True)
        + r"\s*,?\s*)+\s*\]"
    ),
    "display": rx.compile(
        r"display\s*:\s*\{\s*Name\s*:\s*'\s*"
        + Regex.brackets("[", "]", is_group=True)
        + r"\s*'\s*(?:,\s*Lore\s*:\s*"
        + Regex.brackets("[", "]", is_group=True)
        + r"\s*)?\}"
    ),
    "can_place_on": rx.compile(
        r"CanPlaceOn\s*:\s*" + Regex.brackets("[", "]", is_group=True)
    ),
    "entity_tag": rx.compile(
        r"EntityTag\s*:\s*" + Regex.brackets("{", "}", is_group=True)
    ),
    "tags": rx.compile(r"(?<!\\)Tags\s*:\s*" + Regex.brackets("[", "]", is_group=True)),
    "esc_tags": rx.compile(r"\\Tags\s*:\s*" + Regex.brackets("[", "]", is_group=True)),
    "hide_flags": rx.compile(r",?\s*HideFlags\s*:\s*([0-9]+)"),
    "tags_1b": rx.compile(r",?\s*tags\s*:\s*1b"),
}


def is_readable(filepath: Path):
    try:
        with filepath.open("r", encoding="utf-8") as file:
            file.read(1024)
        return True
    except UnicodeDecodeError:
        return False


def update_content(content: str) -> tuple[str, int]:
    changed = 0

    def update_options(options: list) -> str:
        return ",".join(
            (mods := opt.split("="))[0] + f':"{mods[1]}"' for opt in options
        )

    def update_enchantment(enchantment: str) -> str:
        lvl = rx.search(r"lvl\s*:\s*([0-9]+)", enchantment).group(1)
        eid = rx.search(r"id\s*:\s*\"([\w_]+)\"\s*,\s*", enchantment).group(1)
        return f"{eid}:{lvl}" if lvl and eid else enchantment

    def update_attr_mod(modifier: str) -> str:
        typ = (
            rx.search(r"AttributeName\s*:\s*\"([\w._]+)\"", modifier)
            .group(1)
            .replace("generic.", "")
        )
        amount = rx.search(r"Amount\s*:\s*([0-9-.]+)", modifier).group(1)
        slot = (rx.search(r"Slot\s*:\s*\"([\w]+)\"", modifier) or [None])[0]
        operations = ("add_value", "add_multiplied_base", "add_multiplied_total")
        operation = operations[
            int((rx.search(r"Operation\s*:\s*([012])", modifier) or [0])[0])
        ]
        uuid_parts = (
            int(part)
            for part in (
                rx.search(r"UUID\s*:\s*\[I;((?:[0-9-]+,?){4})\]", modifier).group(1)
                or (random.randint(-2147483648, 2147483647) for _ in range(4))
            ).split(",")
        )
        mod_id = str(struct.unpack(">Q", struct.pack(">iiii", *uuid_parts)[8:])[0])[:13]
        return (
            f"{{type:{typ},amount:{amount}"
            + (f",slot:{slot}" if slot else "")
            + f',operation:{operation},id:"{mod_id}"}}'
        )

    def update_entity_tag(entity_tag: str, entity_id: str = None) -> str:
        entity_tag = rx.sub(
            r"Tags\s*:\s*" + Regex.brackets("[", "]", is_group=True),
            lambda m: "\\Tags:["
            + ",".join(
                f'"{String.to_delimited_case(tag.strip().strip('"'))}"'
                for tag in m.group(1).split(",")
            )
            + "]",
            entity_tag,
        )
        return (
            f'id:"{entity_id}",'
            if entity_id and not rx.search(r"id\s*:\s*\"\s*[\w_]+\s*\"", entity_tag)
            else ""
        ) + entity_tag

    def update_can_place_on(can_place_on: str) -> str:
        can_place_on = [
            item[1].strip() for item in rx.findall(Regex.quotes(), can_place_on)
        ]
        options = [
            (
                opts.group(1).strip("[]").split(",")
                if (opts := rx.search(Regex.brackets("[", "]", is_group=True), item))
                else None
            )
            for item in can_place_on
        ]
        can_place_on = [
            rx.sub(Regex.brackets("[", "]"), "", item) for item in can_place_on
        ]
        return ",".join(
            f'{{blocks:"{item}"'
            + (",state:{" + update_options(options[i]) + "}}" if options[i] else "}")
            for i, item in enumerate(can_place_on)
        )

    def update_nbt(nbt: str, entity_id: str = None) -> str:
        nbt = REGEX["unbreakable"].sub("unbreakable={}", nbt)
        nbt = REGEX["enchantment_glint"].sub("enchantment_glint_override=true", nbt)
        nbt = REGEX["block_state_tag"].sub(r"block_state={\1}", nbt)
        nbt = REGEX["damage"].sub(r"damage=\1", nbt)
        nbt = REGEX["custom_model_data"].sub(r"custom_model_data=\1", nbt)
        nbt = REGEX["enchantments"].sub(
            lambda m: "enchantments={levels:{"
            + ",".join(update_enchantment(enchantment) for enchantment in m.groups())
            + "}}",
            nbt,
        )
        nbt = REGEX["attribute_modifiers"].sub(
            lambda m: "attribute_modifiers={modifiers:["
            + ",".join(update_attr_mod(attr_mod) for attr_mod in m.groups())
            + "]}",
            nbt,
        )
        nbt = REGEX["display"].sub(
            lambda m: (
                f"custom_name='[\"\",{m.group(1)}]'"
                + (f",lore=[{m.group(2)}]" if m.group(2) else "")
            ),
            nbt,
        )
        nbt = REGEX["can_place_on"].sub(
            lambda m: "can_place_on={predicates:["
            + update_can_place_on(m.group(1))
            + "]}",
            nbt,
        )
        nbt = REGEX["entity_tag"].sub(
            lambda m: "entity_data={" + update_entity_tag(m.group(1), entity_id) + "}",
            nbt,
        )
        nbt = REGEX["tags"].sub(
            lambda m: "custom_data={"
            + ",".join(
                f"{String.to_delimited_case(tag.strip().strip('"'))}:1"
                for tag in m.group(1).split(",")
            )
            + "}",
            nbt,
        )
        nbt = REGEX["esc_tags"].sub(r"Tags:[\1]", nbt)
        nbt = REGEX["hide_flags"].sub("", nbt)
        nbt = REGEX["tags_1b"].sub("", nbt)
        return f"[{nbt}]"

    content = REGEX["hex"].sub(lambda m: f"{m.group(1)}{m.group(2).upper()}", content)
    content = REGEX["nbt"].sub(
        lambda m: (
            update_nbt(m.group(2), m.group(1)) if m.group(2) else update_nbt(m.group(1))
        ),
        content,
    )
    content = REGEX["tag_usage"].sub(
        lambda m: String.to_delimited_case(m.group(1)), content
    )
    content = REGEX["scoreboard_usage"].sub(
        lambda m: String.to_delimited_case(m.group(1)), content
    )
    content = REGEX["scoreboard_operation"].sub(
        lambda m: f"{String.to_delimited_case(m.group(1))} {m.group(2)} {m.group(3)} {String.to_delimited_case(m.group(4))}",
        content,
    )
    return content, changed


def process_file(file_path: Path, root_dir: Path) -> None:
    if not is_readable(file_path):
        return
    # try:
    content = file_path.read_text(encoding="utf-8")
    new_content, modified = update_content(content)
    file_path.write_text(new_content, encoding="utf-8")
    log_path = str(file_path.relative_to(root_dir))
    dim = "[dim]" if modified < 1 else ""
    Console.done(
        f"{'[b](Updated)' if modified > 0 else '[dim](Checked)'} [br:cyan]({log_path})"
        + f" [dim]({((Console.w() - 50) - len(log_path)) * '.'})"
        + f" {dim}[blue][[b|br:blue]({modified}){dim}[blue]][_]",
        start="",
        end="\n",
    )
    # except Exception as e:
    #     Console.fail(
    #         f"Error processing [red]({file_path})\n         \t[b|br:red]{e}[_]",
    #         start="",
    #         end="\n",
    #         exit=False,
    #     )


def main(path: str) -> None:
    target = Path(path)
    if target.is_file():
        process_file(target, target.parent)
    elif target.is_dir():
        for file_path in target.rglob("*"):
            if file_path.is_file():
                process_file(file_path, path)
    else:
        Console.fail(f"Path not found [white]({path})")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        path = input("\nEnter the path to the file or directory: ").strip()
    else:
        path = sys.argv[1]
    if path in ("", None):
        Console.fail("No path was provided")
    print()
    main(path)
