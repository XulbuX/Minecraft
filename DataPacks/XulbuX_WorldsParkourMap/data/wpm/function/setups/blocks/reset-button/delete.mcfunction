execute at @s run tellraw @a[distance=..6] ["",{"text":"Reset Button","color":"gold","bold":true},{"text":" was removed.","color":"green"}]
execute at @s run particle dust_color_transition{from_color:[.3,.9,.15],to_color:[.2,.3,.2],scale:1} ~ ~.5 ~ .3 .3 .3 .1 50 force @a
kill @s
