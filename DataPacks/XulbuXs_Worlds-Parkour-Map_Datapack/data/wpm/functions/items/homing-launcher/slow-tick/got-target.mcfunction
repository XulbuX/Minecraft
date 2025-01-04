# MOVE
   execute at @s unless block ~ ~ ~ cobweb run tp @s ^ ^ ^.75 facing entity @e[tag=Target,limit=1] eyes
   execute at @s if block ~ ~ ~ cobweb run tp @s ^ ^ ^.05 facing entity @e[tag=Target,limit=1] eyes
# PARTICLES
   execute at @s run particle dust 1 0 1 2 ~ ~ ~ 0 0 0 0 1 force @a
   execute at @s run particle happy_villager ~ ~ ~ .2 .2 .2 0 1 force @a
