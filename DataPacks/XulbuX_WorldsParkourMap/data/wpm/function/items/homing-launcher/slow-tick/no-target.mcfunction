# MOVE
   execute at @s unless block ~ ~ ~ cobweb run tp @s ^ ^ ^.75
   execute at @s if block ~ ~ ~ cobweb run tp @s ^ ^ ^.05
# PARTICLES
   execute at @s run particle dust{color:[0,1,1],scale:2} ~ ~ ~ 0 0 0 0 1 force @a
   execute at @s run particle wax_on ~ ~ ~ .2 .2 .2 0 1 force @a
