execute at @s unless entity @s[scores={wpm_air_lift_setup=1}] run setblock ~ ~ ~ light[level=1] destroy
execute at @s unless entity @s[scores={wpm_air_lift_setup=1}] run scoreboard players set @s wpm_air_lift_setup 1
execute at @s if entity @s[scores={wpm_air_lift_setup=1}] run execute unless block ~ ~ ~ light[level=1] run kill @s

execute if entity @s[tag=new] run tag @s remove new
