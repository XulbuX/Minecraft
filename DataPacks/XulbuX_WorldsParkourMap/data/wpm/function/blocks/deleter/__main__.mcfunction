# START TIMER
   execute as @e[type=interaction,tag=deleter] unless entity @s[scores={remove_deleter=-100..}] run scoreboard players add @s Remove_Deleter 5
# PLACE-PARTICLES
   execute as @e[type=interaction,tag=deleter,tag=play_particles] run function wpm:blocks/deleter/particles
# REMOVE DELETER
   execute as @e[type=interaction,tag=deleter,scores={remove_deleter=..0}] run kill @s
