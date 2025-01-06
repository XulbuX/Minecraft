execute at @s run tellraw @a[distance=..6] ["",{"text":"NO BUTTON WAS FOUND!","bold":true,"color":"red"},"\n",{"text":">","color":"dark_red"},{"text":" Can only be placed on\n  top of a button.","color":"#CC0000"}]
execute at @s run particle dust_color_transition .9 .15 .3 1 .3 .1 .1 ~ ~.5 ~ .3 .3 .3 .1 50 force @a
kill @s
