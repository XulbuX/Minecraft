# PARTICLES ON BOMB
   execute at @e[type=snowball,nbt={Item:{tag:{Tags:["FreezeBomb"]}}},tag=Launched] run particle snowflake ~ ~ ~ 0 0 0 0 1 force @a
# WHILE FROZEN
   execute as @e[scores={Frozen_timer=1..}] run function wpm:items/freeze-bomb/slow-tick/frozen
# TIMER FOR LAUNCHER-PROTECTION
   execute as @e[scores={FreezeLauncher_timer=1..}] run scoreboard players remove @s FreezeLauncher_timer 1
