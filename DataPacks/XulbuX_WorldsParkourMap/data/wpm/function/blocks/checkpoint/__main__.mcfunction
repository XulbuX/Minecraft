# DETECT AND ACTIVATE CHECKPOINT
   execute as @e[tag=!saved] at @s run execute if block ~ ~ ~ light_weighted_pressure_plate[power=1] run scoreboard players set @s checkpoint 1
   execute as @e[scores={checkpoint=1}] run tag @s add saved
# CHECKPOINT SAVED
   execute as @e[scores={checkpoint=1},tag=saved] run function wpm:blocks/checkpoint/save
# RESET
   execute as @e[scores={checkpoint=1}] run scoreboard players set @s checkpoint 0
   execute as @e[tag=saved] at @s run execute unless block ~ ~ ~ light_weighted_pressure_plate[power=1] run tag @s remove saved
