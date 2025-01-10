# MOVE
   execute at @s unless block ~ ~ ~ cobweb run tp @s ^ ^ ^.75 facing entity @e[tag=target,limit=1] eyes
   execute at @s if block ~ ~ ~ cobweb run tp @s ^ ^ ^.05 facing entity @e[tag=target,limit=1] eyes
# PARTICLES
   execute at @s run particle dust{color:[1,0,1],scale:2} ~ ~ ~ 0 0 0 0 1 force @a
   execute at @s run particle happy_villager ~ ~ ~ .2 .2 .2 0 1 force @a
