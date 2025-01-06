# SNAKE  -  RESET
   execute as @e[type=interaction,tag=Snake_Block,tag=ID_defined] run function wpm:blocks/snake/check_not-active
# MANAGE ACTIVATION / RESET  -  TAGS
   execute as @e[type=interaction,tag=Snake_Block,tag=ID_defined,scores={SnakeBlock_ID=0}] run function wpm:blocks/snake/manage_tags
# BARRIER IF PLAYER HOLDING SPAWNEGG NEARBY
   execute as @e[type=interaction,tag=Snake_Block,tag=ID_defined] run function wpm:blocks/snake/barrier
# CHECK IF CONNECTED
   execute as @e[type=interaction,tag=Snake_Block,tag=ID_defined,tag=!Connected] at @s if entity @e[type=interaction,tag=Snake_Block,tag=ID_defined,tag=START,distance=..1.05] run tag @s add Connected
   execute as @e[type=interaction,tag=Snake_Block,tag=ID_defined,tag=Connected] at @s unless entity @e[type=interaction,tag=Snake_Block,tag=ID_defined,tag=START,distance=..1.05] run tag @s remove Connected
# SNAKE FUNCTIONALITY
   execute as @e[type=interaction,tag=Snake_Block,tag=ID_defined,tag=!Barrier_placed] run function wpm:blocks/snake/check_active
