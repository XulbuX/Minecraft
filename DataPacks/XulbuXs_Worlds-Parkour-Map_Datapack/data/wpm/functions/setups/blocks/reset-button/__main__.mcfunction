# CHECK FOR DELETE
   execute as @e[type=interaction,nbt={Tags:["ResetButton"]}] at @s run execute if entity @e[type=interaction,tag=DELETER,distance=..1.5] run function wpm:setups/blocks/reset-button/delete
# POSITIONING
   execute as @e[type=interaction,nbt={Tags:["ResetButton"]},tag=NEW] run function wpm:setups/blocks/reset-button/setup
