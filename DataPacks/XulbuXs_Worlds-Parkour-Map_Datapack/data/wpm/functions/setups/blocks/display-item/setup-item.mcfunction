tag @s add Display_item
tag @s add Play_Particles
execute at @s align xz run tp @s ~.5 ~ ~.5
data merge entity @s {Item:{tag:{Persistent:1b,Enchantments:[{id:"infinity",lvl:100}]}}}
