execute at @s if entity @e[distance=...8,type=!#wpm:not_mob] run tag @s add Explode
execute at @s positioned ~ ~-1 ~ run execute if block ~ ~ ~ #wpm:not_block run execute if entity @e[distance=...9,type=!#wpm:not_mob] run tag @s add Explode
