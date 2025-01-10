execute at @s run tag @e[sort=nearest,limit=1,type=!#wpm:not_mob] add freeze_bomb_launcher
execute at @s run execute if entity @e[tag=freeze_bomb_launcher,distance=..4,sort=nearest] run tag @s add launched
