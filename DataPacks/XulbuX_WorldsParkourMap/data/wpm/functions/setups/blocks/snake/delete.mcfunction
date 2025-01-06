execute at @s run tellraw @a[distance=..6] ["",{"text":"Snake Block","italic":false,"bold":true,"color":"#2461b4"},{"text":" was removed.","color":"green"}]
execute at @s run particle dust_color_transition .3 .9 .15 1 .2 .3 .2 ~ ~ ~ .3 .3 .3 .1 50 force @a
execute unless entity @s[tag=Block_player] at @s unless block ~ ~ ~ air run setblock ~ ~ ~ air
kill @s
