execute at @s unless entity @s[scores={jump_pad=1}] run setblock ~ ~ ~ light[level=2] destroy
execute at @s unless entity @s[scores={jump_pad=1}] run scoreboard players set @s jump_pad 1
execute at @s if entity @s[scores={jump_pad=1}] run execute unless block ~ ~ ~ light[level=2] run kill @s

execute if entity @s[tag=new] run tag @s remove new
