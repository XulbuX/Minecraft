# START TIMER
   execute as @e[type=interaction,tag=wpm_deleter] unless entity @s[scores={wpm_remove_deleter=-100..}] run scoreboard players add @s wpm_remove_deleter 5
# PLACE-PARTICLES
   execute as @e[type=interaction,tag=wpm_deleter,tag=play_particles] run function wpm:blocks/deleter/particles
# REMOVE DELETER
   execute as @e[type=interaction,tag=wpm_deleter,scores={wpm_remove_deleter=..0}] run kill @s
