   # START
      execute if entity @s[tag=!start,scores={snake_block_id=0}] at @s run tag @s add start
   # END
      execute if entity @s[tag=!start] unless entity @s[scores={check_blocks=0}] run scoreboard players set @s check_blocks 0
         execute if entity @s[tag=!start] at @s positioned ~ ~-1 ~ if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=snake_block,tag=id_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=snake_block,tag=id_defined] snake_block_id = @s SnakeBlock_after_ID run scoreboard players add @s Check_Blocks 1
         execute if entity @s[tag=!start] at @s positioned ~1 ~ ~ if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=snake_block,tag=id_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=snake_block,tag=id_defined] snake_block_id = @s SnakeBlock_after_ID run scoreboard players add @s Check_Blocks 1
         execute if entity @s[tag=!start] at @s positioned ~-1 ~ ~ if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=snake_block,tag=id_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=snake_block,tag=id_defined] snake_block_id = @s SnakeBlock_after_ID run scoreboard players add @s Check_Blocks 1
         execute if entity @s[tag=!start] at @s positioned ~ ~ ~1 if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=snake_block,tag=id_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=snake_block,tag=id_defined] snake_block_id = @s SnakeBlock_after_ID run scoreboard players add @s Check_Blocks 1
         execute if entity @s[tag=!start] at @s positioned ~ ~ ~-1 if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=snake_block,tag=id_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=snake_block,tag=id_defined] snake_block_id = @s SnakeBlock_after_ID run scoreboard players add @s Check_Blocks 1
         execute if entity @s[tag=!start] at @s positioned ~ ~1 ~ if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=snake_block,tag=id_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=snake_block,tag=id_defined] snake_block_id = @s SnakeBlock_after_ID run scoreboard players add @s Check_Blocks 1
      execute if entity @s[tag=!start] unless entity @s[scores={check_blocks=2..}] run tag @s remove split
      execute if entity @s[tag=!start,scores={check_blocks=2..}] run tag @s add split
      execute if entity @s[tag=!start] unless entity @s[scores={check_blocks=0}] run tag @s remove end
      execute if entity @s[tag=!start,scores={check_blocks=0}] run tag @s add end
tag @s add start_end_checked
