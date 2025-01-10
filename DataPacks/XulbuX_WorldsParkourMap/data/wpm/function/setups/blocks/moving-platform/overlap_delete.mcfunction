execute at @s run tellraw @a[distance=..6] ["",{"text":"MOVING-PLATFORM'S OVERLAPPING!","bold":true,"color":"red"},"\n",{"text":">","color":"dark_red"},{"text":" Place the Moving_Platform's at a\n  distance so they won't overlap.","color":"#CC0000"}]
execute at @s run particle dust_color_transition{from_color:[.9,.15,.3],to_color:[.3,.1,.1],scale:1} ~ ~.5 ~ .3 .3 .3 .1 50 force @a
kill @s
