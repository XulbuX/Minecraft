# PARTICLES ON BOMB
   execute at @e[type=snowball,nbt={Item:{components:{"minecraft:custom_data":{freeze_bomb:1}}}},tag=launched] run particle snowflake ~ ~ ~ 0 0 0 0 1 force @a
# WHILE FROZEN
   execute as @e[scores={frozen_timer=1..}] run function wpm:items/freeze-bomb/slow-tick/frozen
# TIMER FOR LAUNCHER-PROTECTION
   execute as @e[scores={freeze_launcher_timer=1..}] run scoreboard players remove @s freeze_launcher_timer 1
