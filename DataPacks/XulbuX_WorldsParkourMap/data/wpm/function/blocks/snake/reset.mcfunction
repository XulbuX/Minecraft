execute at @s[tag=!block_player] unless block ~ ~ ~ air run tag @s add block_reset
execute at @s[tag=block_reset] run setblock ~ ~ ~ air
scoreboard players reset @s snake_delay
scoreboard players reset @s snake_timer
tag @s remove block_placed
tag @s remove active
function wpm:blocks/snake/start-split-end
execute if entity @s[tag=!reset,tag=!reset] run tag @s add reset
