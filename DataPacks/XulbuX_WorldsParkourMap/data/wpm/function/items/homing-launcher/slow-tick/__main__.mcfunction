# NO-TARGET TIMER
   execute as @a[scores={homing_launcher_timer=1..}] run scoreboard players remove @s homing_launcher_timer 1
# MOVE MISSILE
   execute as @e[type=area_effect_cloud,tag=homing_missile,tag=no_target] run function wpm:items/homing-launcher/slow-tick/no-target
   execute as @e[type=area_effect_cloud,tag=homing_missile,tag=got_target] run function wpm:items/homing-launcher/slow-tick/got-target
   execute at @e[type=area_effect_cloud,tag=homing_missile] run playsound block.fire.extinguish ambient @a ~ ~ ~ .1 0
