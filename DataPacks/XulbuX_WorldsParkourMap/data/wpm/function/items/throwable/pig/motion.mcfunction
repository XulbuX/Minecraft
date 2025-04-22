# AS AT THROWABLE ROTATED AS PLAYER

execute store result score @s wpm_throw_x1 run data get entity @s Pos[0] 1000000
execute store result score @s wpm_throw_y1 run data get entity @s Pos[1] 1000000
execute store result score @s wpm_throw_z1 run data get entity @s Pos[2] 1000000

tp @s ^ ^ ^1.5

execute store result score @s wpm_throw_x2 run data get entity @s Pos[0] 1000000
execute store result score @s wpm_throw_y2 run data get entity @s Pos[1] 1000000
execute store result score @s wpm_throw_z2 run data get entity @s Pos[2] 1000000

scoreboard players operation @s Throw_x2 -= @s Throw_x1
scoreboard players operation @s Throw_y2 -= @s Throw_y1
scoreboard players operation @s Throw_z2 -= @s Throw_z1

execute store result entity @s Motion[0] double 0.000005 run scoreboard players get @s wpm_throw_x2
execute store result entity @s Motion[1] double 0.000005 run scoreboard players get @s wpm_throw_y2
execute store result entity @s Motion[2] double 0.000005 run scoreboard players get @s wpm_throw_z2

execute store result entity @s power[0] double 0.0000008 run scoreboard players get @s wpm_throw_x2
execute store result entity @s power[1] double 0.0000008 run scoreboard players get @s wpm_throw_y2
execute store result entity @s power[2] double 0.0000008 run scoreboard players get @s wpm_throw_z2

tag @s add motion
