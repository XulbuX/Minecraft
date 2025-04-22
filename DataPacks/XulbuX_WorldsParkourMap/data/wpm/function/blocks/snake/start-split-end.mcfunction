   # START
      execute if entity @s[tag=!start,scores={wpm_snake_block_id=0}] at @s run tag @s add start
   # END
      execute if entity @s[tag=!start] unless entity @s[scores={wpm_check_blocks=0}] run scoreboard players set @s wpm_check_blocks 0
         execute if entity @s[tag=!start] at @s positioned ~ ~-1 ~ if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=wpm_snake_block,tag=id_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=wpm_snake_block,tag=id_defined] wpm_snake_block_id = @s wpm_snake_block_after_id run scoreboard players add @s wpm_check_blocks 1
         execute if entity @s[tag=!start] at @s positioned ~1 ~ ~ if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=wpm_snake_block,tag=id_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=wpm_snake_block,tag=id_defined] wpm_snake_block_id = @s wpm_snake_block_after_id run scoreboard players add @s wpm_check_blocks 1
         execute if entity @s[tag=!start] at @s positioned ~-1 ~ ~ if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=wpm_snake_block,tag=id_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=wpm_snake_block,tag=id_defined] wpm_snake_block_id = @s wpm_snake_block_after_id run scoreboard players add @s wpm_check_blocks 1
         execute if entity @s[tag=!start] at @s positioned ~ ~ ~1 if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=wpm_snake_block,tag=id_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=wpm_snake_block,tag=id_defined] wpm_snake_block_id = @s wpm_snake_block_after_id run scoreboard players add @s wpm_check_blocks 1
         execute if entity @s[tag=!start] at @s positioned ~ ~ ~-1 if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=wpm_snake_block,tag=id_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=wpm_snake_block,tag=id_defined] wpm_snake_block_id = @s wpm_snake_block_after_id run scoreboard players add @s wpm_check_blocks 1
         execute if entity @s[tag=!start] at @s positioned ~ ~1 ~ if entity @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=wpm_snake_block,tag=id_defined] if score @e[type=interaction,distance=...05,sort=nearest,limit=1,tag=wpm_snake_block,tag=id_defined] wpm_snake_block_id = @s wpm_snake_block_after_id run scoreboard players add @s wpm_check_blocks 1
      execute if entity @s[tag=!start] unless entity @s[scores={wpm_check_blocks=2..}] run tag @s remove split
      execute if entity @s[tag=!start,scores={wpm_check_blocks=2..}] run tag @s add split
      execute if entity @s[tag=!start] unless entity @s[scores={wpm_check_blocks=0}] run tag @s remove end
      execute if entity @s[tag=!start,scores={wpm_check_blocks=0}] run tag @s add end
tag @s add start_end_checked
