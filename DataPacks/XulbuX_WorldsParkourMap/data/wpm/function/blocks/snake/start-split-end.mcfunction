   # START
      execute if entity @s[tag=!START,scores={SnakeBlock_ID=0}] at @s run tag @s add START
   # END
      execute if entity @s[tag=!START] unless entity @s[scores={Check_Blocks=0}] run scoreboard players set @s Check_Blocks 0
         execute if entity @s[tag=!START] at @s positioned ~ ~-1 ~ if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=Snake_Block,tag=ID_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=Snake_Block,tag=ID_defined] SnakeBlock_ID = @s SnakeBlock_after_ID run scoreboard players add @s Check_Blocks 1
         execute if entity @s[tag=!START] at @s positioned ~1 ~ ~ if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=Snake_Block,tag=ID_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=Snake_Block,tag=ID_defined] SnakeBlock_ID = @s SnakeBlock_after_ID run scoreboard players add @s Check_Blocks 1
         execute if entity @s[tag=!START] at @s positioned ~-1 ~ ~ if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=Snake_Block,tag=ID_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=Snake_Block,tag=ID_defined] SnakeBlock_ID = @s SnakeBlock_after_ID run scoreboard players add @s Check_Blocks 1
         execute if entity @s[tag=!START] at @s positioned ~ ~ ~1 if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=Snake_Block,tag=ID_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=Snake_Block,tag=ID_defined] SnakeBlock_ID = @s SnakeBlock_after_ID run scoreboard players add @s Check_Blocks 1
         execute if entity @s[tag=!START] at @s positioned ~ ~ ~-1 if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=Snake_Block,tag=ID_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=Snake_Block,tag=ID_defined] SnakeBlock_ID = @s SnakeBlock_after_ID run scoreboard players add @s Check_Blocks 1
         execute if entity @s[tag=!START] at @s positioned ~ ~1 ~ if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=Snake_Block,tag=ID_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=Snake_Block,tag=ID_defined] SnakeBlock_ID = @s SnakeBlock_after_ID run scoreboard players add @s Check_Blocks 1
      execute if entity @s[tag=!START] unless entity @s[scores={Check_Blocks=2..}] run tag @s remove SPLIT
      execute if entity @s[tag=!START,scores={Check_Blocks=2..}] run tag @s add SPLIT
      execute if entity @s[tag=!START] unless entity @s[scores={Check_Blocks=0}] run tag @s remove END
      execute if entity @s[tag=!START,scores={Check_Blocks=0}] run tag @s add END
tag @s add StartEnd_checked
