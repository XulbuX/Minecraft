execute at @s unless entity @s[scores={AirLift=1}] run setblock ~ ~ ~ light[level=1] destroy
execute at @s unless entity @s[scores={AirLift=1}] run scoreboard players set @s AirLift 1
execute at @s if entity @s[scores={AirLift=1}] run execute unless block ~ ~ ~ light[level=1] run kill @s

execute if entity @s[tag=NEW] run tag @s remove NEW
