# WHILE NOT ACTIVE
   execute at @s if entity @s[tag=reset] run function wpm:blocks/snake/reset
   execute at @s if entity @e[type=interaction,distance=.001..1,tag=snake_block,tag=id_defined,tag=reset] if score @s snake_block_before_id = @e[type=interaction,distance=.001..1,limit=1,tag=snake_block,tag=id_defined,tag=reset] SnakeBlock_ID run function wpm:blocks/snake/reset
   execute at @s if entity @e[type=interaction,distance=.001..1,tag=snake_block,tag=id_defined,tag=reset] if score @s snake_block_before_id = @e[type=interaction,distance=.001..1,limit=1,tag=snake_block,tag=id_defined,tag=reset] SnakeBlock_ID run function wpm:blocks/snake/reset
