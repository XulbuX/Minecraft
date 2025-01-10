execute if entity @s[tag=no_target] run function wpm:items/homing-launcher/define-target
execute if entity @s[tag=got_target] run function wpm:items/homing-launcher/got-target
execute at @s if block ~ ~ ~ #wpm:not_block run tag @s add no_block
execute at @s if entity @s[tag=!no_block] unless block ~ ~ ~ air run tag @s add homing_destroy
execute at @s if entity @s[tag=!no_block,tag=homing_destroy] if block ~ ~ ~ #wpm:not_block run tag @s remove homing_destroy
execute if entity @s[tag=no_block] run tag @s remove no_block
execute if entity @s[tag=homing_destroy] run function wpm:items/homing-launcher/explode
