execute as @e[type=interaction,tag=Snake_Block,tag=ID_defined] at @s run particle sculk_charge_pop ~ ~ ~ 0 0 0 0 1 force @a

## START / END / SPLIT
# START
   execute as @e[type=interaction,tag=Snake_Block,tag=ID_defined,tag=START] at @s run particle dust .4 1 .6 1 ~ ~ ~ .1 .1 .1 0 1 force @a
# SPLIT
   execute as @e[type=interaction,tag=Snake_Block,tag=ID_defined,tag=SPLIT] at @s run particle dust 1 .7 .3 1 ~ ~ ~ .1 .1 .1 0 1 force @a
# END
   execute as @e[type=interaction,tag=Snake_Block,tag=ID_defined,tag=END] at @s run particle dust 1 .4 .4 1 ~ ~ ~ .1 .1 .1 0 1 force @a
