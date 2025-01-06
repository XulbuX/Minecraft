execute at @s run tellraw @a[distance=..6] ["",{"text":"BUY-STATION'S TOO CLOSE TO EACHOTHER!","bold":true,"color":"red"},"\n",{"text":">","color":"dark_red"},{"text":" Place the Buy_Station's with a minimum\n  distance of two blocks to eachother.","color":"#CC0000"}]
execute at @s run particle dust_color_transition .9 .15 .3 1 .3 .1 .1 ~ ~1.5 ~ .4 .4 .4 .1 75 force @a
kill @s
