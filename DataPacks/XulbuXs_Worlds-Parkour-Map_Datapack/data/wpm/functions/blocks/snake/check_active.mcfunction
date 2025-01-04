# WHILE ACTIVE
   execute at @s if entity @s[tag=ACTIVE] run function wpm:blocks/snake/active
   execute at @s if entity @e[type=interaction,distance=.001..1,tag=Snake_Block,tag=ID_defined,tag=ACTIVE] if score @s SnakeBlock_before_ID = @e[type=interaction,distance=.001..1,limit=1,tag=Snake_Block,tag=ID_defined,tag=ACTIVE] SnakeBlock_ID run function wpm:blocks/snake/active
   execute at @s if entity @e[type=interaction,distance=.001..1,tag=Snake_Block,tag=ID_defined,tag=active] if score @s SnakeBlock_before_ID = @e[type=interaction,distance=.001..1,limit=1,tag=Snake_Block,tag=ID_defined,tag=active] SnakeBlock_ID run function wpm:blocks/snake/active
