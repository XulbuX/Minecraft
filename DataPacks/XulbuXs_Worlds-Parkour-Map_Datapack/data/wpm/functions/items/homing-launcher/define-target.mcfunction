execute at @s as @e[distance=..10,sort=nearest,limit=1,tag=!HomingMissile_Launcher,type=!#wpm:not_mob] run tag @s add Target
execute at @s if entity @e[distance=..10,sort=nearest,limit=1,tag=Target] run tag @s add GotTarget
