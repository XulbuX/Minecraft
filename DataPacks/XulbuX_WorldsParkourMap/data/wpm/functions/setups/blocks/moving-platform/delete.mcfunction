execute at @s run tellraw @a[distance=..6] ["",{"text":"Moving Platform","color":"#00bbe0","bold":true},{"text":" was removed.","color":"green"}]
execute at @s run particle dust_color_transition .3 .9 .15 1 .2 .3 .2 ~ ~.75 ~ .75 .3 .75 .1 100 force @a
execute at @s run function wpm:setups/blocks/moving-platform/delete_platform-parts
kill @s
