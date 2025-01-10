execute at @s run execute if entity @e[tag=iced,sort=nearest,limit=1,distance=.005..] run tp @s @e[tag=iced,sort=nearest,limit=1]
data merge entity @s {Rotation:[0f,0f]}
execute at @s run execute unless entity @e[tag=iced,distance=...01] run kill @s
