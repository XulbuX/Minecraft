# CHECK FOR DELETE
   execute as @e[type=interaction,nbt={Tags:["Snake_Block"]}] at @s run execute if entity @e[type=interaction,tag=DELETER,distance=..1.5] run function wpm:setups/blocks/snake/delete
# SETUP
   execute as @e[type=interaction,nbt={Tags:["Snake_Block"]},tag=NEW] run function wpm:setups/blocks/snake/setup
   execute as @e[type=interaction,nbt={Tags:["Snake_Block"]},scores={SnakeBlock_ID=1..}] run function wpm:setups/blocks/snake/set_id-color
