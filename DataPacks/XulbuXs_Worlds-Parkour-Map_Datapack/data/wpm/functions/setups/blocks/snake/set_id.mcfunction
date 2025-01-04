# SET ID
   execute at @s positioned ~ ~-1 ~ run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] run scoreboard players operation @s SnakeBlock_ID = @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] SnakeBlock_ID
   execute at @s positioned ~1 ~ ~ run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] run scoreboard players operation @s SnakeBlock_ID = @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] SnakeBlock_ID
   execute at @s positioned ~-1 ~ ~ run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] run scoreboard players operation @s SnakeBlock_ID = @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] SnakeBlock_ID
   execute at @s positioned ~ ~ ~1 run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] run scoreboard players operation @s SnakeBlock_ID = @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] SnakeBlock_ID
   execute at @s positioned ~ ~ ~-1 run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] run scoreboard players operation @s SnakeBlock_ID = @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] SnakeBlock_ID
   execute at @s positioned ~ ~1 ~ run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] run scoreboard players operation @s SnakeBlock_ID = @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] SnakeBlock_ID
   scoreboard players add @s SnakeBlock_ID 1
# SET BEFORE-ID
   scoreboard players operation @s SnakeBlock_before_ID = @s SnakeBlock_ID
   scoreboard players remove @s SnakeBlock_before_ID 1
# SET AFTER-ID
   scoreboard players operation @s SnakeBlock_after_ID = @s SnakeBlock_ID
   scoreboard players add @s SnakeBlock_after_ID 1
