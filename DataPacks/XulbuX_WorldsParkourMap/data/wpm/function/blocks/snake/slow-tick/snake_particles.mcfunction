execute as @e[type=interaction,tag=wpm_snake_block,tag=id_defined] at @s run particle sculk_charge_pop ~ ~ ~ 0 0 0 0 1 force @a

## START / END / SPLIT
# START
   execute as @e[type=interaction,tag=wpm_snake_block,tag=id_defined,tag=start] at @s run particle dust{color:[.4,1.0,.6],scale:1} ~ ~ ~ .1 .1 .1 0 1 force @a
# SPLIT
   execute as @e[type=interaction,tag=wpm_snake_block,tag=id_defined,tag=split] at @s run particle dust{color:[1.0,.7,.3],scale:1} ~ ~ ~ .1 .1 .1 0 1 force @a
# END
   execute as @e[type=interaction,tag=wpm_snake_block,tag=id_defined,tag=end] at @s run particle dust{color:[1.0,.4,.4],scale:1} ~ ~ ~ .1 .1 .1 0 1 force @a
