execute at @s unless entity @s[scores={wpm_jump_pad_setup=1}] run setblock ~ ~ ~ light[level=2] destroy
execute at @s unless entity @s[scores={wpm_jump_pad_setup=1}] run scoreboard players set @s wpm_jump_pad_setup 1
execute at @s if entity @s[scores={wpm_jump_pad_setup=1}] run execute unless block ~ ~ ~ light[level=2] run kill @s

execute if entity @s[tag=new] run tag @s remove new
