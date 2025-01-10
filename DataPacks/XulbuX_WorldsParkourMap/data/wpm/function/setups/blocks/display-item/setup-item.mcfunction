tag @s add display_item
tag @s add play_particles
execute at @s align xz run tp @s ~.5 ~ ~.5
data merge entity @s {Item:{tag:{Persistent:1b,Enchantments:[{id:"infinity",lvl:100}]}}}
