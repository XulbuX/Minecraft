execute at @s run tellraw @a[distance=..6] ["",{"text":"NO ITEM WAS FOUND NEARBY!","bold":true,"color":"red"},"\n",{"text":">","color":"dark_red"},{"text":" Place the Display_Item-spawnegg\n  in a radius of 1.5 blocks\n  to an item on the ground.","color":"#CC0000"}]
execute at @s run particle dust_color_transition .9 .15 .3 1 .3 .1 .1 ~ ~.5 ~ .3 .3 .3 .1 50 force @a
kill @s
