# CHECK FOR DELETE
   # THROUGH DELETER
      execute as @e[type=interaction,nbt={Tags:["_MovingPlatform_"]}] at @s run execute if entity @e[type=interaction,tag=DELETER,distance=..2.85] run function wpm:setups/blocks/moving-platform/delete
   # INVALID POSITIONS
      execute as @e[type=interaction,nbt={Tags:["_MovingPlatform_"]},tag=NEW] run function wpm:setups/blocks/moving-platform/check_invalid-pos
      execute as @e[type=interaction,nbt={Tags:["_MovingPlatform_"]},tag=InWall_DELETE] run function wpm:setups/blocks/moving-platform/in-wall_delete
      execute as @e[type=interaction,nbt={Tags:["_MovingPlatform_"]},tag=Overlap_DELETE] run function wpm:setups/blocks/moving-platform/overlap_delete
# POSITIONING
   execute as @e[type=interaction,nbt={Tags:["_MovingPlatform_"]},tag=NEW] run function wpm:setups/blocks/moving-platform/setup
