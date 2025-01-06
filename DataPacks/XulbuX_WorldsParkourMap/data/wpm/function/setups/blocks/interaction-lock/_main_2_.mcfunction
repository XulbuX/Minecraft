# POSITION
   execute if entity @s[tag=!Positioned] at @s run function wpm:setups/blocks/interaction-lock/position
# CHECK FOR DELETE
   execute if entity @s[tag=Positioned] at @s run execute if entity @e[type=interaction,tag=DELETER,distance=..1.5] run function wpm:setups/blocks/interaction-lock/delete
