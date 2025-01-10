execute at @s run tellraw @a[distance=..6] ["",{"text":"Display Item","bold":true,"color":"#ABADCD"},{"text":" got removed.","color":"#7C86EE"},"\n",{"text":">","color":"#404FE3"},{"text":" There was no block\n  underneath the item.","color":"blue"}]
execute at @s run particle dust_color_transition{from_color:[.25,.25,.9],to_color:[.15,.15,.3],scale:1} ~ ~.5 ~ .3 .3 .3 .1 50 force @a
kill @s
