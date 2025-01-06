execute at @s run tellraw @a[distance=..6] ["",{"text":"Display Item","bold":true,"color":"#abadcd"},{"text":" got removed.","bold":false,"color":"#7c86ee"},"\n",{"text":">","color":"#404fe3"},{"text":" There was no air where\n  the item was positioned.","color":"blue"}]
execute at @s run particle dust_color_transition .25 .25 .9 1 .15 .15 .3 ~ ~.5 ~ .5 .5 .5 .1 100 force @a
kill @s
