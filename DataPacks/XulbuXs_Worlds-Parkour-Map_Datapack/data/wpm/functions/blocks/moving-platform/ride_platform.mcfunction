execute as @e[type=!#wpm:not_mob] at @s if entity @e[tag=_MovingPlatform_,distance=..2.5,scores={Moving_distance=-1..}] run function wpm:blocks/moving-platform/check_riding-up
execute as @e[tag=RidingPlatform_UP] run function wpm:blocks/moving-platform/move_onto-platform
execute as @e[tag=RidingPlatform_LEVITATE] run effect give @s levitation infinite 255 true
execute as @e[tag=!RidingPlatform_LEVITATE] run effect clear @s levitation
