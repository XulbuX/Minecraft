execute at @s run execute if entity @e[tag=Iced,sort=nearest,limit=1,distance=.005..] run tp @s @e[tag=Iced,sort=nearest,limit=1]
data merge entity @s {Rotation:[0f,0f,0f]}
execute at @s run execute unless entity @e[tag=Iced,distance=...01] run kill @s
