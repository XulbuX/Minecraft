execute at @s[tag=!Block_player] unless block ~ ~ ~ air run tag @s add Block_reset
execute at @s[tag=Block_reset] run setblock ~ ~ ~ air
scoreboard players reset @s Snake_delay
scoreboard players reset @s Snake_timer
tag @s remove Block_placed
tag @s remove active
function wpm:blocks/snake/start-split-end
execute if entity @s[tag=!reset,tag=!RESET] run tag @s add reset
