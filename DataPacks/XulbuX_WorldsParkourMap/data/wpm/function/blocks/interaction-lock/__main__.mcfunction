# CHECK FOR INTERACTION
   execute as @e[type=interaction,tag=wpm_int_lock,tag=positioned,tag=visible] if data entity @s interaction on target run function wpm:blocks/interaction-lock/interaction
   execute as @e[type=interaction,tag=wpm_int_lock,tag=positioned,tag=visible] if data entity @s attack on attacker run function wpm:blocks/interaction-lock/interaction
# CLEAR INTERACTION
   execute as @e[type=interaction,tag=wpm_int_lock,tag=positioned,tag=visible] if data entity @s interaction run data remove entity @s interaction
   execute as @e[type=interaction,tag=wpm_int_lock,tag=positioned,tag=visible] if data entity @s attack run data remove entity @s attack
