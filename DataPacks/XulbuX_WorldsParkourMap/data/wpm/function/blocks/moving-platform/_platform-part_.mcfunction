# GET Y-POS
    execute at @s store result score @s pos_y run data get entity @s Pos[1] 100
# CHECK TP-TO-MAIN-PART
    execute at @s unless score @s pos_y = @e[type=interaction,tag=_moving_platform_,distance=..1.75,sort=nearest,limit=1] Pos_Y run function wpm:blocks/moving-platform/tp-to_main-part
# SET MOVING-DIRECTION
    execute at @s positioned ~ ~ ~ if entity @e[tag=_moving_platform_,distance=..1.45,scores={moving_dir=1,moving_break=0}] run tag @s add moving_up
    execute at @s[tag=moving_up] positioned ~ ~ ~ unless entity @e[tag=_moving_platform_,distance=..1.45,scores={moving_dir=1,moving_break=0}] run tag @s remove moving_up
    execute at @s positioned ~ ~ ~ if entity @e[tag=_moving_platform_,distance=..1.45,scores={moving_dir=-1,moving_break=0}] run tag @s add moving_down
    execute at @s[tag=moving_down] positioned ~ ~ ~ unless entity @e[tag=_moving_platform_,distance=..1.45,scores={moving_dir=-1,moving_break=0}] run tag @s remove moving_down
    execute at @s positioned ~ ~ ~ if entity @e[tag=_moving_platform_,distance=..1.45,scores={moving_break=1..}] run tag @s add moving_paused
    execute at @s[tag=moving_paused] positioned ~ ~ ~ unless entity @e[tag=_moving_platform_,distance=..1.45,scores={moving_break=1..}] run tag @s remove moving_paused
# MAKE MOB / PLAYER RIDE THE PLATFORM UPWARDS
    execute as @e[type=!#wpm:not_mob] run function wpm:blocks/moving-platform/ride_platform
# DAMAGE MOB / PLAYER IF INSIDE THE PLATFORM (WITH CUSTOM DEATH MESSAGE)
    execute as @e[type=!#wpm:not_mob] at @s positioned ~ ~ ~ if entity @e[type=block_display,tag=moving_platform,tag=!moving_up,distance=...8] run function wpm:blocks/moving-platform/squish_damage
