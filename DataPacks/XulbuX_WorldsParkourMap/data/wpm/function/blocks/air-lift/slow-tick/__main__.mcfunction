# AIR-LIFT PARTICLES
   execute as @e[type=interaction,nbt={Tags:["wpm_air_lift"]}] if entity @s[scores={wpm_air_lift_setup=1}] at @s run function wpm:blocks/air-lift/slow-tick/particles
# AIR-LIFT TIMER
   execute as @e[scores={wpm_air_lift_timer=1..}] run scoreboard players remove @s wpm_air_lift_timer 1
