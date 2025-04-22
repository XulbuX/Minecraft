scoreboard players set @s wpm_snake_block_id 0
# CHECK FOR OTHER SNAKE-PARTS
   scoreboard players set @s wpm_check_blocks 0
   scoreboard players set @s wpm_check_blocks_2 0
   execute at @s positioned ~ ~-1 ~ run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] run scoreboard players add @s wpm_check_blocks 1
      execute at @s positioned ~ ~-1 ~ run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined,tag=!connected,scores={wpm_snake_block_id=1}] run scoreboard players add @s wpm_check_blocks_2 1
   execute at @s positioned ~1 ~ ~ run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] run scoreboard players add @s wpm_check_blocks 1
      execute at @s positioned ~1 ~ ~ run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined,tag=!connected,scores={wpm_snake_block_id=1}] run scoreboard players add @s wpm_check_blocks_2 1
   execute at @s positioned ~-1 ~ ~ run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] run scoreboard players add @s wpm_check_blocks 1
      execute at @s positioned ~-1 ~ ~ run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined,tag=!connected,scores={wpm_snake_block_id=1}] run scoreboard players add @s wpm_check_blocks_2 1
   execute at @s positioned ~ ~ ~1 run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] run scoreboard players add @s wpm_check_blocks 1
      execute at @s positioned ~ ~ ~1 run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined,tag=!connected,scores={wpm_snake_block_id=1}] run scoreboard players add @s wpm_check_blocks_2 1
   execute at @s positioned ~ ~ ~-1 run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] run scoreboard players add @s wpm_check_blocks 1
      execute at @s positioned ~ ~ ~-1 run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined,tag=!connected,scores={wpm_snake_block_id=1}] run scoreboard players add @s wpm_check_blocks_2 1
   execute at @s positioned ~ ~1 ~ run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] run scoreboard players add @s wpm_check_blocks 1
      execute at @s positioned ~ ~1 ~ run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined,tag=!connected,scores={wpm_snake_block_id=1}] run scoreboard players add @s wpm_check_blocks_2 1
# DELETE IF MORE THAN 1
   execute if entity @s[scores={wpm_check_blocks=2..}] run function wpm:setups/blocks/snake/too-many-parts_delete
# SET ID
   execute if entity @s[scores={wpm_check_blocks=1..}] run function wpm:setups/blocks/snake/set_id
   execute if entity @s[scores={wpm_snake_block_id=2,wpm_check_blocks_2=1..}] run function wpm:setups/blocks/snake/set_id_start-block
# GET BLOCK-TYPE
   execute if entity @s[scores={wpm_snake_block_id=0}] run function wpm:gen_funcs/check_blocks/colored_blocks/get_id
tag @s add id_defined
