# START TIMER
   execute as @e[type=interaction,tag=DELETER] unless entity @s[scores={Remove_Deleter=-100..}] run scoreboard players add @s Remove_Deleter 5
# PLACE-PARTICLES
   execute as @e[type=interaction,tag=DELETER,tag=Play_Particles] run function wpm:blocks/deleter/particles
# REMOVE DELETER
   execute as @e[type=interaction,tag=DELETER,scores={Remove_Deleter=..0}] run kill @s
