execute at @s run tp @s ~ ~.5 ~
tag @s add Positioned

execute if entity @s[tag=NEW] run tag @s remove NEW
