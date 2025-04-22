# CHECK FOR ENTITY
   # START AIR-LIFT
      execute as @e[type=!#wpm:not_mob] run function wpm:blocks/air-lift/check-start
      execute as @e[tag=wpm_air_lift_active] run scoreboard players set @s wpm_air_lift_active 0
   # CHECK IF AIR-LIFT STILL WORKING
      execute as @e[tag=wpm_air_lift_active] run scoreboard players set @s wpm_air_lift_active 0
      execute as @e[tag=wpm_air_lift_active] run function wpm:blocks/air-lift/check-stop
# GIVE & STOP EFFECTS
   # GIVE EFFECT
      execute as @e[tag=wpm_air_lift_active] run effect give @s levitation infinite 5 true
      execute as @e[tag=wpm_air_lift_active] at @s run playsound entity.allay.item_thrown player @s ~ ~ ~ 1 .5
   # RESET
   execute as @e[tag=wpm_air_lift_active] run execute unless entity @s[scores={wpm_air_lift_active=1..}] run function wpm:blocks/air-lift/reset
