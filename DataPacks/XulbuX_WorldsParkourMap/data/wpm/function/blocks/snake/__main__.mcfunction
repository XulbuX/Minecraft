# SNAKE  -  RESET
   execute as @e[type=interaction,tag=wpm_snake_block,tag=id_defined] run function wpm:blocks/snake/check_not-active
# MANAGE ACTIVATION / RESET  -  TAGS
   execute as @e[type=interaction,tag=wpm_snake_block,tag=id_defined,scores={wpm_snake_block_id=0}] run function wpm:blocks/snake/manage_tags
# BARRIER IF PLAYER HOLDING SPAWNEGG NEARBY
   execute as @e[type=interaction,tag=wpm_snake_block,tag=id_defined] run function wpm:blocks/snake/barrier
# CHECK IF CONNECTED
   execute as @e[type=interaction,tag=wpm_snake_block,tag=id_defined,tag=!connected] at @s if entity @e[type=interaction,tag=wpm_snake_block,tag=id_defined,tag=start,distance=..1.05] run tag @s add connected
   execute as @e[type=interaction,tag=wpm_snake_block,tag=id_defined,tag=connected] at @s unless entity @e[type=interaction,tag=wpm_snake_block,tag=id_defined,tag=start,distance=..1.05] run tag @s remove connected
# SNAKE FUNCTIONALITY
   execute as @e[type=interaction,tag=wpm_snake_block,tag=id_defined,tag=!barrier_placed] run function wpm:blocks/snake/check_active
