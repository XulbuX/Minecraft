execute at @s run tag @e[sort=nearest,limit=1,type=!#wpm:not_mob] add FreezeBomb_Launcher
execute at @s run execute if entity @e[tag=FreezeBomb_Launcher,distance=..4,sort=nearest] run tag @s add Launched
