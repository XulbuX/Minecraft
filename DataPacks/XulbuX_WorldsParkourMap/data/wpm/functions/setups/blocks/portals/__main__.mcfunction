# CHECK FOR DELETE
   execute as @e[type=interaction,tag=PORTAL] at @s run execute if entity @e[type=interaction,tag=DELETER,distance=..1.5] run function wpm:setups/blocks/portals/delete

execute if entity @s[tag=NEW] run tag @s remove NEW
