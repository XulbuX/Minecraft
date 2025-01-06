execute if entity @s[tag=NoTarget] run function wpm:items/homing-launcher/define-target
execute if entity @s[tag=GotTarget] run function wpm:items/homing-launcher/got-target
execute at @s if block ~ ~ ~ #wpm:not_block run tag @s add NoBlock
execute at @s if entity @s[tag=!NoBlock] unless block ~ ~ ~ air run tag @s add HomingDestroy
execute at @s if entity @s[tag=!NoBlock,tag=HomingDestroy] if block ~ ~ ~ #wpm:not_block run tag @s remove HomingDestroy
execute if entity @s[tag=NoBlock] run tag @s remove NoBlock
execute if entity @s[tag=HomingDestroy] run function wpm:items/homing-launcher/explode
