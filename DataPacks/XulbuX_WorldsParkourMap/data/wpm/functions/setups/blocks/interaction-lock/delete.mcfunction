execute at @s run tellraw @a[distance=..6] ["",{"text":"Interaction","color":"#ff4853","bold":true},{"text":"Lock","color":"#e5182e","bold":true},{"text":" was removed.","color":"green"}]
execute at @s run particle dust_color_transition .3 .9 .15 1 .2 .3 .2 ~ ~.5 ~ .3 .3 .3 .1 50 force @a
kill @s
