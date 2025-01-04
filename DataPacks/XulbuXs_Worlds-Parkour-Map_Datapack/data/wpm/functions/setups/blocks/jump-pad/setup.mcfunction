execute at @s unless entity @s[scores={JumpPad=1}] run setblock ~ ~ ~ light[level=2] destroy
execute at @s unless entity @s[scores={JumpPad=1}] run scoreboard players set @s JumpPad 1
execute at @s if entity @s[scores={JumpPad=1}] run execute unless block ~ ~ ~ light[level=2] run kill @s

execute if entity @s[tag=NEW] run tag @s remove NEW
