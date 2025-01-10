# CHECK FOR DELETE
   execute as @e[type=interaction,nbt={Tags:["air_lift"]}] at @s run execute if entity @e[type=interaction,tag=deleter,distance=..1.5] run function wpm:setups/blocks/air-lift/delete
# AIR-LIFT  -  SETUP
   execute as @e[type=interaction,nbt={Tags:["air_lift"]},tag=new] run function wpm:setups/blocks/air-lift/setup
