execute at @s run tellraw @a[distance=..6] ["",{"text":"Jump Pad","color":"#00cc66","bold":true},{"text":" was removed.","color":"green"}]
execute at @s run particle dust_color_transition .3 .9 .15 1 .2 .3 .2 ~ ~.5 ~ .3 .3 .3 .1 50 force @a
execute at @s if block ~ ~ ~ light[level=2] run setblock ~ ~ ~ air
kill @s
