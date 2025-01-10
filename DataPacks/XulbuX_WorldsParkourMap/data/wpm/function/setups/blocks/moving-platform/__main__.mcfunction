# CHECK FOR DELETE
   # THROUGH DELETER
      execute as @e[type=interaction,nbt={Tags:["_moving_platform_"]}] at @s run execute if entity @e[type=interaction,tag=deleter,distance=..2.85] run function wpm:setups/blocks/moving-platform/delete
   # INVALID POSITIONS
      execute as @e[type=interaction,nbt={Tags:["_moving_platform_"]},tag=new] run function wpm:setups/blocks/moving-platform/check_invalid-pos
      execute as @e[type=interaction,nbt={Tags:["_moving_platform_"]},tag=in_wall_delete] run function wpm:setups/blocks/moving-platform/in-wall_delete
      execute as @e[type=interaction,nbt={Tags:["_moving_platform_"]},tag=overlap_delete] run function wpm:setups/blocks/moving-platform/overlap_delete
# POSITIONING
   execute as @e[type=interaction,nbt={Tags:["_moving_platform_"]},tag=new] run function wpm:setups/blocks/moving-platform/setup
