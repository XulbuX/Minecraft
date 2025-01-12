execute at @s positioned ^ ^ ^.5 run summon area_effect_cloud ~ ~ ~ {Radius:0f,Duration:200,Tags:["homing_missile","no_target","not_rotated"],CustomName:'[{"text":"Homing Missile","color":"red"}]'}
execute as @e[tag=homing_missile,tag=not_rotated] run function wpm:items/homing-launcher/rotate
playsound minecraft:entity.ender_dragon.flap player @a ~ ~ ~ .5 1.2
playsound minecraft:entity.generic.burn player @a ~ ~ ~ .25 1
tag @s remove ammo_shown
execute unless entity @s[scores={homing_ammo=..0}] run scoreboard players set @s homing_launcher_timer 30
execute if entity @s[scores={homing_ammo=-1}] run scoreboard players set @s homing_launcher_timer 30
tag @s add homing_missile_launcher
