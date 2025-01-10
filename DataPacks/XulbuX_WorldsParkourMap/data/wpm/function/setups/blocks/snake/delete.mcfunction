execute at @s run tellraw @a[distance=..6] ["",{"text":"Snake Block","bold":true,"color":"#2461B4"},{"text":" was removed.","color":"green"}]
execute at @s run particle dust_color_transition{from_color:[.3,.9,.15],to_color:[.2,.3,.2],scale:1} ~ ~ ~ .3 .3 .3 .1 50 force @a
execute unless entity @s[tag=block_player] at @s unless block ~ ~ ~ air run setblock ~ ~ ~ air
kill @s
