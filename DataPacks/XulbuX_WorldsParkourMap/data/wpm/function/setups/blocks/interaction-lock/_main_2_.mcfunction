# POSITION
   execute if entity @s[tag=!positioned] at @s run function wpm:setups/blocks/interaction-lock/position
# CHECK FOR DELETE
   execute if entity @s[tag=positioned] at @s run execute if entity @e[type=interaction,tag=deleter,distance=..1.5] run function wpm:setups/blocks/interaction-lock/delete
