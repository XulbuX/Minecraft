# CHECK FOR DELETE
   execute as @e[type=interaction,tag=buy_station] at @s run execute if entity @e[type=interaction,tag=deleter,distance=..1.5] run function wpm:setups/buy-stands/general_delete

function wpm:setups/buy-stands/station/freeze-bomb/__main__
