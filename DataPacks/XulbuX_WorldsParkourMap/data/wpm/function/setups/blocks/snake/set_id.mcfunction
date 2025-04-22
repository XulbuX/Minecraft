# SET ID
   execute at @s positioned ~ ~-1 ~ run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] run scoreboard players operation @s wpm_snake_block_id = @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] wpm_snake_block_id
   execute at @s positioned ~1 ~ ~ run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] run scoreboard players operation @s wpm_snake_block_id = @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] wpm_snake_block_id
   execute at @s positioned ~-1 ~ ~ run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] run scoreboard players operation @s wpm_snake_block_id = @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] wpm_snake_block_id
   execute at @s positioned ~ ~ ~1 run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] run scoreboard players operation @s wpm_snake_block_id = @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] wpm_snake_block_id
   execute at @s positioned ~ ~ ~-1 run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] run scoreboard players operation @s wpm_snake_block_id = @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] wpm_snake_block_id
   execute at @s positioned ~ ~1 ~ run execute if entity @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] run scoreboard players operation @s wpm_snake_block_id = @e[type=interaction,nbt={Tags:["wpm_snake_block"]},distance=...05,sort=nearest,limit=1,tag=id_defined] wpm_snake_block_id
   scoreboard players add @s wpm_snake_block_id 1
# SET BEFORE-ID
   scoreboard players operation @s wpm_snake_block_before_id = @s wpm_snake_block_id
   scoreboard players remove @s wpm_snake_block_before_id 1
# SET AFTER-ID
   scoreboard players operation @s wpm_snake_block_after_id = @s wpm_snake_block_id
   scoreboard players add @s wpm_snake_block_after_id 1
