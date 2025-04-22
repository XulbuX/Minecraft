# CHECK FOR DELETE
   execute as @e[type=interaction,nbt={Tags:["wpm_air_lift"]}] at @s run execute if entity @e[type=interaction,tag=wpm_deleter,distance=..1.5] run function wpm:setups/blocks/air-lift/delete
# AIR-LIFT  -  SETUP
   execute as @e[type=interaction,nbt={Tags:["wpm_air_lift"]},tag=new] run function wpm:setups/blocks/air-lift/setup
