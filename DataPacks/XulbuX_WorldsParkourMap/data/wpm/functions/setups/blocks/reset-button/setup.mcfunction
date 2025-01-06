execute at @s if entity @s[tag=!Positioned] unless block ~ ~ ~ #buttons run function wpm:setups/blocks/reset-button/no-button_delete

execute at @s if entity @s[tag=!Positioned] if block ~ ~ ~ #buttons run tp @s ~ ~.35 ~
execute at @s if entity @s[tag=!Positioned] if block ~ ~ ~ #buttons run tag @s add Positioned

execute if entity @s[tag=NEW] run tag @s remove NEW
