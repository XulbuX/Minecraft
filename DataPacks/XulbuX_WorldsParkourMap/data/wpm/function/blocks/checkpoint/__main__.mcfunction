# DETECT AND ACTIVATE CHECKPOINT
   execute as @e[tag=!wpm_checkpoint_saved] at @s run execute if block ~ ~ ~ light_weighted_pressure_plate[power=1] run scoreboard players set @s wpm_is_on_checkpoint 1
   execute as @e[scores={wpm_is_on_checkpoint=1}] run tag @s add wpm_checkpoint_saved
# CHECKPOINT SAVED
   execute as @e[scores={wpm_is_on_checkpoint=1},tag=wpm_checkpoint_saved] run function wpm:blocks/checkpoint/save
# RESET
   execute as @e[scores={wpm_is_on_checkpoint=1}] run scoreboard players set @s wpm_is_on_checkpoint 0
   execute as @e[tag=wpm_checkpoint_saved] at @s run execute unless block ~ ~ ~ light_weighted_pressure_plate[power=1] run tag @s remove wpm_checkpoint_saved
