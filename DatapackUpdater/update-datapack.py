import json
import sys
import os
import re


def rename_directories(root_dir: str) -> None:
    dir_mapping = {
        "structures": "structure",
        "advancements": "advancement",
        "recipes": "recipe",
        "loot_tables": "loot_table",
        "predicates": "predicate",
        "item_modifiers": "item_modifier",
        "functions": "function",
        "tags/functions": "tags/function",
        "tags/items": "tags/item",
        "tags/blocks": "tags/block",
        "tags/entity_types": "tags/entity_type",
        "tags/fluids": "tags/fluid",
        "tags/game_events": "tags/game_event",
    }
    for old, new in dir_mapping.items():
        old_path = os.path.join(root_dir, old)
        new_path = os.path.join(root_dir, new)
        if os.path.exists(old_path):
            os.rename(old_path, new_path)
            print(f"Renamed {old_path} to {new_path}")


def update_file_contents(file_path: str) -> None:
    with open(file_path, "r") as file:
        content = file.read()
    content = re.sub(  # UPDATE NBT STRUCTURE
        r'{Enchantments:\[{id:"minecraft:(\w+)",lvl:(\d+)}\]}',
        r"[enchantments={levels:{\1=\2}}]",
        content,
    )
    content = re.sub(  # UPDATE EXECUTE COMMAND
        r"execute if function", "execute if function_loaded", content
    )
    content = re.sub(r"return run", "return", content)  # UPDATE RETURN RUN COMMAND
    with open(file_path, "w") as file:
        file.write(content)


def update_pack_mcmeta(root_dir: str) -> None:
    mcmeta_path = os.path.join(root_dir, "pack.mcmeta")
    if os.path.exists(mcmeta_path):
        with open(mcmeta_path, "r") as file:
            data = json.load(file)
        data["pack"]["pack_format"] = 18  # UPDATE TO VERSION 1.21.x FORMAT
        with open(mcmeta_path, "w") as file:
            json.dump(data, file, indent=4)
        print(f"Updated pack.mcmeta to format 18")


def update_datapack(root_dir: str) -> None:
    rename_directories(root_dir)
    for root, dirs, files in os.walk(root_dir):
        for file in files:
            if file.endswith((".json", ".mcfunction")):
                file_path = os.path.join(root, file)
                update_file_contents(file_path)
                print(f"Updated contents of {file_path}")
    update_pack_mcmeta(root_dir)


if __name__ == "__main__":
    datapack_path = sys.argv[1]  # PATH TO DATAPACK ROOT DIRECTORY
    update_datapack(datapack_path)
