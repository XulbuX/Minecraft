# CHECK FOR DELETE
   execute as @e[type=interaction,nbt={Tags:["snake_block"]}] at @s run execute if entity @e[type=interaction,tag=deleter,distance=..1.5] run function wpm:setups/blocks/snake/delete
# SETUP
   execute as @e[type=interaction,nbt={Tags:["snake_block"]},tag=new] run function wpm:setups/blocks/snake/setup
   execute as @e[type=interaction,nbt={Tags:["snake_block"]},scores={snake_block_id=1..}] run function wpm:setups/blocks/snake/set_id-color
