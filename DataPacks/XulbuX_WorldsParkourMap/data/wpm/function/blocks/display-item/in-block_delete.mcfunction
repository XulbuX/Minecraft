execute at @s run tellraw @a[distance=..6] ["",{"text":"Display Item","italic":false,"bold":true,"color":"#ABADCD"},{"text":" got removed.","italic":false,"bold":false,"color":"#7C86EE"},"\n",{"text":">","italic":false,"bold":false,"color":"#404FE3"},{"text":" There was no air where\n  the item was positioned.","italic":false,"bold":false,"color":"blue"}]
execute at @s run particle dust_color_transition{from_color:[.25,.25,.9],to_color:[.15,.15,.3],scale:1} ~ ~.5 ~ .5 .5 .5 .1 100 force @a
kill @s
