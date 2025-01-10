execute at @s run tp @s ~ ~.5 ~
tag @s add positioned

execute if entity @s[tag=new] run tag @s remove new
