# CHECK FOR DELETE
   execute as @e[type=interaction,tag=wpm_portal] at @s run execute if entity @e[type=interaction,tag=wpm_deleter,distance=..1.5] run function wpm:setups/blocks/portals/delete

execute if entity @s[tag=new] run tag @s remove new
