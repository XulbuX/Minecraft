data merge entity @s {Age:0}
execute if entity @s[tag=no_target] run tag @s remove no_target
execute at @s unless entity @e[tag=target,distance=..10,limit=1] run kill @s
execute at @s if entity @e[distance=..2,tag=target] run tag @s add homing_destroy
