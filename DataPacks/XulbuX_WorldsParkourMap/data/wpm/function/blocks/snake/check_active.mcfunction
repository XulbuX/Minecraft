# WHILE ACTIVE
   execute at @s if entity @s[tag=active] run function wpm:blocks/snake/active
   execute at @s if entity @e[type=interaction,distance=.001..1,tag=wpm_snake_block,tag=id_defined,tag=active] if score @s wpm_snake_block_before_id = @e[type=interaction,distance=.001..1,limit=1,tag=wpm_snake_block,tag=id_defined,tag=active] wpm_snake_block_id run function wpm:blocks/snake/active
   execute at @s if entity @e[type=interaction,distance=.001..1,tag=wpm_snake_block,tag=id_defined,tag=active] if score @s wpm_snake_block_before_id = @e[type=interaction,distance=.001..1,limit=1,tag=wpm_snake_block,tag=id_defined,tag=active] wpm_snake_block_id run function wpm:blocks/snake/active
