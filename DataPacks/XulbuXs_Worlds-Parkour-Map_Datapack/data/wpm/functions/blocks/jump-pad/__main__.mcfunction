# check for entity
   execute as @e[type=!#wpm:not_mob] at @s run execute if block ~ ~ ~ light[level=2] run tag @s add JumpPad_active
# GIVE & STOP EFFECTS
   # GIVE EFFECT
      execute as @e[tag=JumpPad_active] run effect give @s levitation infinite 25 true
      execute as @e[tag=JumpPad_active,tag=!Sound_played] run function wpm:blocks/jump-pad/playsound
   # RESET
      execute as @e[tag=JumpPad_active] at @s unless block ~ ~ ~ light[level=2] run function wpm:blocks/jump-pad/reset
