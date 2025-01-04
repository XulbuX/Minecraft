# AIR-LIFT PARTICLES
   execute as @e[type=interaction,nbt={Tags:["AirLift"]}] at @s run execute if entity @s[scores={AirLift=1}] run function wpm:blocks/air-lift/slow-tick/particles
# AIR-LIFT TIMER
   execute as @e[scores={AirLift_timer=1..}] run scoreboard players remove @s AirLift_timer 1
