# check for entity
   execute as @e[type=!#wpm:not_mob] at @s run execute if block ~ ~ ~ light[level=2] run tag @s add jump_pad_active
# GIVE & STOP EFFECTS
   # GIVE EFFECT
      execute as @e[tag=jump_pad_active] run effect give @s levitation infinite 25 true
      execute as @e[tag=jump_pad_active,tag=!sound_played] run function wpm:blocks/jump-pad/playsound
   # RESET
      execute as @e[tag=jump_pad_active] at @s unless block ~ ~ ~ light[level=2] run function wpm:blocks/jump-pad/reset
