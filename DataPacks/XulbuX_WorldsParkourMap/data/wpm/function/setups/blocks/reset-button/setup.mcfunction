execute at @s if entity @s[tag=!positioned] unless block ~ ~ ~ #buttons run function wpm:setups/blocks/reset-button/no-button_delete

execute at @s if entity @s[tag=!positioned] if block ~ ~ ~ #buttons run tp @s ~ ~.35 ~
execute at @s if entity @s[tag=!positioned] if block ~ ~ ~ #buttons run tag @s add positioned

execute if entity @s[tag=new] run tag @s remove new
