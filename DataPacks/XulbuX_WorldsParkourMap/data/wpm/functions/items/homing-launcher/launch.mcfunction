execute at @s positioned ^ ^ ^.5 run summon area_effect_cloud ~ ~ ~ {Radius:0f,Duration:200,Tags:["HomingMissile","NotRotated","NoTarget"],CustomName:'[{"text":"Homing Missile","color":"red"}]'}
execute as @e[tag=HomingMissile,tag=NotRotated] run function wpm:items/homing-launcher/rotate
playsound minecraft:entity.ender_dragon.flap player @a ~ ~ ~ .5 1.2
playsound minecraft:entity.generic.burn player @a ~ ~ ~ .25 1
tag @s remove AmmoShown
execute unless entity @s[scores={HomingAmmo=..0}] run scoreboard players set @s HomingLauncher_timer 30
execute if entity @s[scores={HomingAmmo=-1}] run scoreboard players set @s HomingLauncher_timer 30
tag @s add HomingMissile_Launcher
