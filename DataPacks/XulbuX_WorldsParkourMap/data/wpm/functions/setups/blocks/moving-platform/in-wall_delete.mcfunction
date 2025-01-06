execute at @s run tellraw @a[distance=..6] ["",{"text":"MOVING-PLATFORM INSIDE OF A FULL-BLOCK!","bold":true,"color":"red"},"\n",{"text":">","color":"dark_red"},{"text":" Place the Moving_Platform so that\n  it is not inside a full-block.","color":"#CC0000"}]
execute at @s run particle dust_color_transition .9 .15 .3 1 .3 .1 .1 ~ ~.5 ~ .3 .3 .3 .1 50 force @a
kill @s
