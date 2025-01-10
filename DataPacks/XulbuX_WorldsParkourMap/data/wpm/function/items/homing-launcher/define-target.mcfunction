execute at @s as @e[distance=..10,sort=nearest,limit=1,tag=!homing_missile_launcher,type=!#wpm:not_mob] run tag @s add target
execute at @s if entity @e[distance=..10,sort=nearest,limit=1,tag=target] run tag @s add got_target
