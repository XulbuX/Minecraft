# WHILE NOT ACTIVE
   execute at @s if entity @s[tag=RESET] run function wpm:blocks/snake/reset
   execute at @s if entity @e[type=interaction,distance=.001..1,tag=Snake_Block,tag=ID_defined,tag=RESET] if score @s SnakeBlock_before_ID = @e[type=interaction,distance=.001..1,limit=1,tag=Snake_Block,tag=ID_defined,tag=RESET] SnakeBlock_ID run function wpm:blocks/snake/reset
   execute at @s if entity @e[type=interaction,distance=.001..1,tag=Snake_Block,tag=ID_defined,tag=reset] if score @s SnakeBlock_before_ID = @e[type=interaction,distance=.001..1,limit=1,tag=Snake_Block,tag=ID_defined,tag=reset] SnakeBlock_ID run function wpm:blocks/snake/reset
