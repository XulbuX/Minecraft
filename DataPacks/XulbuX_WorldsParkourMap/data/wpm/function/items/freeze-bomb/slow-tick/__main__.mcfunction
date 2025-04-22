# PARTICLES ON BOMB
   execute at @e[type=snowball,nbt={Item:{components:{"minecraft:custom_data":{wpm_freeze_bomb:1}}}},tag=launched] run particle snowflake ~ ~ ~ 0 0 0 0 1 force @a
# WHILE FROZEN
   execute as @e[scores={wpm_frozen_timer=1..}] run function wpm:items/freeze-bomb/slow-tick/frozen
# TIMER FOR LAUNCHER-PROTECTION
   execute as @e[scores={wpm_freeze_launcher_timer=1..}] run scoreboard players remove @s wpm_freeze_launcher_timer 1
