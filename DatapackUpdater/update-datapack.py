from xulbux import Console, String, Regex
from pathlib import Path
import regex as rx
import difflib
import random
import struct
import sys

SELECTOR = r"(?:\*|\@[aenprs]|[^\s]+)"
REGEX = {
    "hex": rx.compile(r"(#|0x)([0-9a-fA-F]{8}|[0-9a-fA-F]{6}|[0-9a-fA-F]{3,4})\b"),
    "give_clear_nbt": rx.compile(
        r"(?<=(?:give|clear)\s+"
        + SELECTOR
        + r"\s+(?:minecraft:)?([\w:_]+)\s*)"
        + Regex.brackets("{", "}", is_group=True)
    ),
    "nbt_brackets": rx.compile(Regex.brackets("{", "}", is_group=True)),
    "tag_usage": rx.compile(
        r"(?<=(?:"
        + SELECTOR
        + r"\s*\[.*?,?\s*tag\s*=\s*)|(?:tag\s+"
        + SELECTOR
        + r"\s+(?:add|remove)\s+))(!?[\w+-._]+)"
    ),
    "team_usage": rx.compile(
        r"(?<=(?:"
        + SELECTOR
        + r"\s*\[.*?,?\s*team\s*=\s*)|(?:team\s+(?:add|empty|join|list|modify|remove)\s+))(!?[\w+-._]+)"
    ),
    "score_usage": rx.compile(
        r"(?<="
        + SELECTOR
        + r"\s*\[.*?,?\s*scores\s*=\s*)\{\s*((?:[\w+-._]+\s*=\s*[0-9-.]+\s*,?\s*)+)\s*}"
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
    "text": rx.compile(
        r'\{\s*(?:("\s*[\w_]+\s*"\s*:\s*(?:".*?"|[\w_]+))\s*,?\s*)*?("\s*text\s*":\s*".*?")\s*(?:("\s*[\w_]+\s*"\s*:\s*(?:".*?"|[\w_]+))\s*,?\s*)*?\}'
    ),
    "particle_item": rx.compile(
        r"(?<=particle\s+item)\s+([\w_]+)\s+((?:[0-9-.~]+\s+){6})((?:[0-9-.]+\s+){2})"
    ),
    "particle_block": rx.compile(
        r"(?<=particle\s+(?:block|block_marker))\s+([\w_]+)\s+((?:[0-9-.~]+\s+){6})((?:[0-9-.]+\s+){2})"
    ),
    "particle_color": rx.compile(
        r"(?<=particle\s+(?:dust|entity_effect))\s+((?:[0-9-.]+\s+){3})([0-9-.]+\s+)((?:[0-9-.~]+\s+){6})((?:[0-9-.]+\s+){2})"
    ),
    "particle_color_transition": rx.compile(
        r"(?<=particle\s+dust_color_transition)\s+((?:[0-9-.]+\s+){3})([0-9-.]+\s+)((?:[0-9-.]+\s+){3})((?:[0-9-.~]+\s+){6})((?:[0-9-.]+\s+){2})"
    ),
    "generic_attribute": rx.compile(
        r"(?<=attribute\s+" + SELECTOR + r"\s+)(?:minecraft:)?generic.([\w._]+)"
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
    "can_destroy": rx.compile(
        r"CanDestroy\s*:\s*" + Regex.brackets("[", "]", is_group=True)
    ),
    "entity_tag": rx.compile(
        r"(,?)\s*EntityTag\s*:\s*" + Regex.brackets("{", "}", is_group=True)
    ),
    "tags": rx.compile(r"Tags\s*:\s*" + Regex.brackets("[", "]", is_group=True)),
    "not_esc_tags": rx.compile(
        r"(?<!\\)Tags\s*:\s*" + Regex.brackets("[", "]", is_group=True)
    ),
    "esc_tags": rx.compile(r"\\Tags\s*:\s*" + Regex.brackets("[", "]", is_group=True)),
    "tag_tags": rx.compile(
        r"tag\s*:\s*\{\s*Tags\s*:\s*"
        + Regex.brackets("[", "]", is_group=True)
        + r"\s*\}"
    ),
    "hide_flags": rx.compile(r",?\s*HideFlags\s*:\s*([0-9]+)"),
    "tags_1b": rx.compile(r",?\s*tags\s*:\s*1b"),
}


class NBT:

    @staticmethod
    def update_options(options: list) -> str:
        return ",".join(
            (mods := opt.split("="))[0] + f':"{mods[1]}"' for opt in options
        )

    @staticmethod
    def update_tags(tags: str) -> str:
        return ",".join(
            f"{String.to_delimited_case(tag.strip().strip('"'))}:1"
            for tag in tags.split(",")
        )

    @staticmethod
    def update_enchantment(enchantment: str) -> str:
        lvl = rx.search(r"lvl\s*:\s*([0-9]+)", enchantment).group(1)
        eid = rx.search(r"id\s*:\s*\"([\w_]+)\"\s*,\s*", enchantment).group(1)
        return f"{eid}:{lvl}" if lvl and eid else enchantment

    @staticmethod
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

    @staticmethod
    def update_entity_tag(entity_tag: str, entity_id: str = None) -> str:
        entity_tag = REGEX["tags"].sub(
            lambda m: "\\Tags:["
            + ",".join(
                sorted(
                    set(
                        f'"{String.to_delimited_case(tag.strip().strip('"'))}"'
                        for tag in m.group(1).split(",")
                    )
                )
            )
            + "]",
            entity_tag,
        )
        if not entity_id in ("item_frame", "glow_item_frame"):
            entity_tag = rx.sub(r",?\s*Invisible\s*:\s*1b?", "", entity_tag)
        return entity_tag

    @staticmethod
    def update_adventure_rules(rules: str) -> str:
        rules = [item[1].strip() for item in rx.findall(Regex.quotes(), rules)]
        options = [
            (
                opts.group(1).strip("[]").split(",")
                if (opts := rx.search(Regex.brackets("[", "]", is_group=True), item))
                else None
            )
            for item in rules
        ]
        rules = [rx.sub(Regex.brackets("[", "]"), "", item) for item in rules]
        return ",".join(
            f'{{blocks:"{item}"'
            + (
                ",state:{" + NBT.update_options(options[i]) + "}}"
                if options[i]
                else "}"
            )
            for i, item in enumerate(rules)
        )

    def update(nbt: str, brackets: str, entity_id: str = None) -> str:
        nbt = REGEX["unbreakable"].sub("unbreakable={show_in_tooltip:false}", nbt)
        nbt = REGEX["enchantment_glint"].sub("enchantment_glint_override=true", nbt)
        nbt = REGEX["block_state_tag"].sub(r"block_state={\1}", nbt)
        nbt = REGEX["damage"].sub(r"damage=\1", nbt)
        nbt = REGEX["custom_model_data"].sub(r"custom_model_data=\1", nbt)
        nbt = REGEX["enchantments"].sub(
            lambda m: "enchantments={levels:{"
            + ",".join(
                NBT.update_enchantment(enchantment) for enchantment in m.groups()
            )
            + "}}",
            nbt,
        )
        nbt = REGEX["attribute_modifiers"].sub(
            lambda m: "attribute_modifiers={modifiers:["
            + ",".join(NBT.update_attr_mod(attr_mod) for attr_mod in m.groups())
            + "],show_in_tooltip:false}",
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
            + NBT.update_adventure_rules(m.group(1))
            + "],show_in_tooltip:false}",
            nbt,
        )
        nbt = REGEX["can_destroy"].sub(
            lambda m: "can_break={predicates:["
            + NBT.update_adventure_rules(m.group(1))
            + "],show_in_tooltip:false}",
            nbt,
        )
        nbt = REGEX["entity_tag"].sub(
            lambda m: (
                ""
                if (updated := NBT.update_entity_tag(m.group(2), entity_id))
                in (None, "", "{}")
                else (m.group(1) + "entity_data={" + updated + "}")
            ),
            nbt,
        )
        if brackets == "[]":
            nbt = REGEX["not_esc_tags"].sub(
                lambda m: "custom_data={" + NBT.update_tags(m.group(1)) + "}",
                nbt,
            )
        nbt = REGEX["esc_tags"].sub(r"Tags:[\1]", nbt)
        nbt = REGEX["tag_tags"].sub(
            lambda m: 'components:{"minecraft:custom_data":{'
            + NBT.update_tags(m.group(1))
            + "}}",
            nbt,
        )
        nbt = REGEX["hide_flags"].sub("", nbt)
        nbt = REGEX["tags_1b"].sub("", nbt)
        return f"{brackets[0]}{nbt}{brackets[1]}"


class Particles:

    def update(content: str) -> str:
        content = REGEX["particle_item"].sub(
            lambda m: f"{{item:{{id:{m.group(1)}}}}} {m.group(2).strip()} {m.group(3).strip()} ",
            content,
        )
        content = REGEX["particle_block"].sub(
            lambda m: f"{{block_state:{{Name:{m.group(1)}}}}} {m.group(2).strip()} {m.group(3).strip()} ",
            content,
        )
        content = REGEX["particle_color"].sub(
            lambda m: "{"
            + f"color:[{",".join(m.group(1).strip().split())}],scale:{m.group(2).strip()}"
            + f"}} {m.group(3).strip()} {m.group(4).strip()} ",
            content,
        )
        content = REGEX["particle_color_transition"].sub(
            lambda m: "{"
            + f"from_color:[{",".join(m.group(1).strip().split())}],to_color:[{",".join(m.group(3).strip().split())}],scale:{m.group(2).strip()}"
            + f"}} {m.group(4).strip()} {m.group(5).strip()} ",
            content,
        )
        return content


class Normalize:

    def update(content: str) -> str:
        content = REGEX["tags"].sub(
            lambda m: "Tags:["
            + ",".join(
                sorted(
                    set(
                        f'"{String.to_delimited_case(tag.strip().strip("\""))}"'
                        for tag in m.group(1).split(",")
                    )
                )
            )
            + "]",
            content,
        )
        content = REGEX["tag_usage"].sub(
            lambda m: String.to_delimited_case(m.group(1)), content
        )
        content = REGEX["team_usage"].sub(
            lambda m: String.to_delimited_case(m.group(1)), content
        )
        content = REGEX["score_usage"].sub(
            lambda m: "{"
            + ",".join(
                f"{String.to_delimited_case(score_check[0])}={score_check[1]}"
                for score_check in rx.findall(
                    r"([\w+-._]+)\s*=\s*([0-9-.]+)\s*,?\s*", m.group(1)
                )
            )
            + "}",
            content,
        )
        content = REGEX["scoreboard_usage"].sub(
            lambda m: String.to_delimited_case(m.group(1)), content
        )
        content = REGEX["scoreboard_operation"].sub(
            lambda m: f"{String.to_delimited_case(m.group(1))} {m.group(2)} {m.group(3)} {String.to_delimited_case(m.group(4))}",
            content,
        )
        print(REGEX["text"].findall(content))
        # content = REGEX["text"].sub(lambda m: f"text:{m.group(2)}", content)
        return content


def is_readable(file: Path):
    try:
        with file.open("r", encoding="utf-8") as f:
            f.read(1024)
        return True
    except UnicodeDecodeError:
        return False


def count_diffs(string_1: str, string_2: str) -> int:
    return sum(
        1
        for tag, _, _, _, _ in difflib.SequenceMatcher(
            None, string_1, string_2
        ).get_opcodes()
        if tag != "equal"
    )


def update_content(content: str) -> tuple[str, int]:
    _content = content
    content = REGEX["hex"].sub(lambda m: f"{m.group(1)}{m.group(2).upper()}", content)
    content = REGEX["give_clear_nbt"].sub(
        lambda m: NBT.update(m.group(2), "[]", m.group(1)),
        content,
    )
    content = REGEX["nbt_brackets"].sub(lambda m: NBT.update(m.group(1), "{}"), content)
    content = REGEX["generic_attribute"].sub(r"\1", content)
    content = Particles.update(content)
    content = Normalize.update(content)
    return content, count_diffs(_content, content)


def process_file(file_path: Path, root_dir: Path) -> None:
    if not is_readable(file_path):
        return
    # try:
    content = file_path.read_text(encoding="utf-8")
    new_content, modified = update_content(content)
    if modified:
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
