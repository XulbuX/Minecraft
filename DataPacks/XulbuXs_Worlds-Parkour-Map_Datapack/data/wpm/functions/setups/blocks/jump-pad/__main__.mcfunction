# CHECK FOR DELETE
   execute as @e[type=interaction,nbt={Tags:["JumpPad"]}] at @s run execute if entity @e[type=interaction,tag=DELETER,distance=..1.5] run function wpm:setups/blocks/jump-pad/delete
# JUMP-PAD  -  SETUP
   execute as @e[type=interaction,nbt={Tags:["JumpPad"]},tag=NEW] run function wpm:setups/blocks/jump-pad/setup
