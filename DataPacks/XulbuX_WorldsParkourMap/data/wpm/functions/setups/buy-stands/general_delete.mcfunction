execute at @s run tellraw @a[distance=..6] ["",{"text":"BUY-STATION","color":"#F7E83B","bold":true},{"text":" was removed.","color":"green"}]
execute at @s run particle dust_color_transition .3 .9 .15 1 .2 .3 .2 ~ ~1.5 ~ .4 .4 .4 .1 75 force @a
kill @s
