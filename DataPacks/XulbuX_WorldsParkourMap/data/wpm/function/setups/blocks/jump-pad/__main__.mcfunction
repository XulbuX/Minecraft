# CHECK FOR DELETE
   execute as @e[type=interaction,nbt={Tags:["wpm_jump_pad"]}] at @s run execute if entity @e[type=interaction,tag=wpm_deleter,distance=..1.5] run function wpm:setups/blocks/jump-pad/delete
# JUMP-PAD  -  SETUP
   execute as @e[type=interaction,nbt={Tags:["wpm_jump_pad"]},tag=new] run function wpm:setups/blocks/jump-pad/setup
