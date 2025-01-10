# AIR-LIFT PARTICLES
   execute as @e[type=interaction,nbt={Tags:["air_lift"]}] at @s run execute if entity @s[scores={air_lift=1}] run function wpm:blocks/air-lift/slow-tick/particles
# AIR-LIFT TIMER
   execute as @e[scores={air_lift_timer=1..}] run scoreboard players remove @s air_lift_timer 1
