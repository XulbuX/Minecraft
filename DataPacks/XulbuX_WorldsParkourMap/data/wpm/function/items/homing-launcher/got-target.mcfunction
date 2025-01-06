data merge entity @s {Age:0}
execute if entity @s[tag=NoTarget] run tag @s remove NoTarget
execute at @s unless entity @e[tag=Target,distance=..10,limit=1] run kill @s
execute at @s if entity @e[distance=..2,tag=Target] run tag @s add HomingDestroy
