# MOVE LANDMINE DOWN
   execute at @s run tp @s ~ ~-.5 ~
   execute at @s run particle dust_color_transition 1 0 0 1 .5 .5 .5 ~ ~ ~ .1 .1 .1 0 5 force @a
   execute at @s if block ~ ~-.5 ~ air run tp @s ~ ~-.5 ~
   execute at @s run particle dust_color_transition 1 0 0 1 .5 .5 .5 ~ ~ ~ .1 .1 .1 0 5 force @a
   execute at @s run playsound entity.item_frame.add_item player @a ~ ~ ~ .2 0
# CONFIRM CORRECT LANDMINE POSITION
   function wpm:gen_funcs/check_blocks/-1/__main__
