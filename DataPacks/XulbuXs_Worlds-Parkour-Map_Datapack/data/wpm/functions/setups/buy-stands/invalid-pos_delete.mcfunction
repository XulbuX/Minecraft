execute at @s run tellraw @a[distance=..6] ["",{"text":"INVALID BUY-STATION POSITION!","bold":true,"color":"red"},"\n",{"text":">","color":"dark_red"},{"text":" Place the Buy_Station against\n  a flat wall or in a corner.","color":"#cc0000"}]
execute at @s run particle dust_color_transition .9 .15 .3 1 .3 .1 .1 ~ ~.5 ~ .3 .3 .3 .1 50 force @a
kill @s
