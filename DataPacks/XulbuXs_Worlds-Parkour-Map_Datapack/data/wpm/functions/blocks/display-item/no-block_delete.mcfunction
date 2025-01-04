execute at @s run tellraw @a[distance=..6] ["",{"text":"Display Item","bold":true,"color":"#abadcd"},{"text":" got removed.","bold":false,"color":"#7c86ee"},"\n",{"text":">","color":"#404fe3"},{"text":" There was no block\n  underneath the item.","color":"blue"}]
execute at @s run particle dust_color_transition .25 .25 .9 1 .15 .15 .3 ~ ~.5 ~ .3 .3 .3 .1 50 force @a
kill @s
