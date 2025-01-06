# DETECT AND ACTIVATE CHECKPOINT
   execute as @e[tag=!Saved] at @s run execute if block ~ ~ ~ light_weighted_pressure_plate[power=1] run scoreboard players set @s Checkpoint 1
   execute as @e[scores={Checkpoint=1}] run tag @s add Saved
# CHECKPOINT SAVED
   execute as @e[scores={Checkpoint=1},tag=Saved] run function wpm:blocks/checkpoint/save
# RESET
   execute as @e[scores={Checkpoint=1}] run scoreboard players set @s Checkpoint 0
   execute as @e[tag=Saved] at @s run execute unless block ~ ~ ~ light_weighted_pressure_plate[power=1] run tag @s remove Saved
