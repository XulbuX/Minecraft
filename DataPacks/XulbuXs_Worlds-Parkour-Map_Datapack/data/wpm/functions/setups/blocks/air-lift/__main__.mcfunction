# CHECK FOR DELETE
   execute as @e[type=interaction,nbt={Tags:["AirLift"]}] at @s run execute if entity @e[type=interaction,tag=DELETER,distance=..1.5] run function wpm:setups/blocks/air-lift/delete
# AIR-LIFT  -  SETUP
   execute as @e[type=interaction,nbt={Tags:["AirLift"]},tag=NEW] run function wpm:setups/blocks/air-lift/setup
