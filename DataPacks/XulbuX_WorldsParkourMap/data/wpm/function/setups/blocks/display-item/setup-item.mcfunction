tag @s add display_item
tag @s add play_particles
execute at @s align xz run tp @s ~.5 ~ ~.5
data merge entity @s {Item:{components:{"minecraft:enchantment_glint_override":true,"minecraft:entity_data":{Persistent:1b}}}}
