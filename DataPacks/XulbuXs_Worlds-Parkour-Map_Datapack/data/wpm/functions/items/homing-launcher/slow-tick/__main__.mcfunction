# NO-TARGET TIMER
   execute as @a[scores={HomingLauncher_timer=1..}] run scoreboard players remove @s HomingLauncher_timer 1
# MOVE MISSILE
   execute as @e[type=area_effect_cloud,tag=HomingMissile,tag=NoTarget] run function wpm:items/homing-launcher/slow-tick/no-target
   execute as @e[type=area_effect_cloud,tag=HomingMissile,tag=GotTarget] run function wpm:items/homing-launcher/slow-tick/got-target
   execute at @e[type=area_effect_cloud,tag=HomingMissile] run playsound block.fire.extinguish ambient @a ~ ~ ~ .1 0
