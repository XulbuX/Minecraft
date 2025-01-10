execute at @s run tp @e[type=item,distance=..1.5,tag=!display_item,sort=nearest,limit=1] @s
execute at @s as @e[type=item,distance=..1.5,tag=!display_item,sort=nearest,limit=1] run function wpm:setups/blocks/display-item/setup-item

kill @s
