# CHECK FOR DELETE
   execute as @e[type=interaction,nbt={Tags:["reset_button"]}] at @s run execute if entity @e[type=interaction,tag=deleter,distance=..1.5] run function wpm:setups/blocks/reset-button/delete
# POSITIONING
   execute as @e[type=interaction,nbt={Tags:["reset_button"]},tag=new] run function wpm:setups/blocks/reset-button/setup
