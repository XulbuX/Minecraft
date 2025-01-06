scoreboard players set @s SnakeBlock_ID 0
# CHECK FOR OTHER SNAKE-PARTS
   scoreboard players set @s Check_Blocks 0
   scoreboard players set @s Check_Blocks_2 0
   execute at @s positioned ~ ~-1 ~ run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] run scoreboard players add @s Check_Blocks 1
      execute at @s positioned ~ ~-1 ~ run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined,tag=!Connected,scores={SnakeBlock_ID=1}] run scoreboard players add @s Check_Blocks_2 1
   execute at @s positioned ~1 ~ ~ run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] run scoreboard players add @s Check_Blocks 1
      execute at @s positioned ~1 ~ ~ run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined,tag=!Connected,scores={SnakeBlock_ID=1}] run scoreboard players add @s Check_Blocks_2 1
   execute at @s positioned ~-1 ~ ~ run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] run scoreboard players add @s Check_Blocks 1
      execute at @s positioned ~-1 ~ ~ run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined,tag=!Connected,scores={SnakeBlock_ID=1}] run scoreboard players add @s Check_Blocks_2 1
   execute at @s positioned ~ ~ ~1 run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] run scoreboard players add @s Check_Blocks 1
      execute at @s positioned ~ ~ ~1 run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined,tag=!Connected,scores={SnakeBlock_ID=1}] run scoreboard players add @s Check_Blocks_2 1
   execute at @s positioned ~ ~ ~-1 run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] run scoreboard players add @s Check_Blocks 1
      execute at @s positioned ~ ~ ~-1 run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined,tag=!Connected,scores={SnakeBlock_ID=1}] run scoreboard players add @s Check_Blocks_2 1
   execute at @s positioned ~ ~1 ~ run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined] run scoreboard players add @s Check_Blocks 1
      execute at @s positioned ~ ~1 ~ run execute if entity @e[type=interaction,nbt={Tags:["Snake_Block"]},distance=...05,sort=nearest,limit=1,tag=ID_defined,tag=!Connected,scores={SnakeBlock_ID=1}] run scoreboard players add @s Check_Blocks_2 1
# DELETE IF MORE THAN 1
   execute if entity @s[scores={Check_Blocks=2..}] run function wpm:setups/blocks/snake/too-many-parts_delete
# SET ID
   execute if entity @s[scores={Check_Blocks=1..}] run function wpm:setups/blocks/snake/set_id
   execute if entity @s[scores={SnakeBlock_ID=2,Check_Blocks_2=1..}] run function wpm:setups/blocks/snake/set_id_start-block
# GET BLOCK-TYPE
   execute if entity @s[scores={SnakeBlock_ID=0}] run function wpm:gen_funcs/check_blocks/colored_blocks/get_id
tag @s add ID_defined
