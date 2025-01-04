# GET Y-POS
    execute at @s store result score @s Pos_Y run data get entity @s Pos[1] 100
# CHECK TP-TO-MAIN-PART
    execute at @s unless score @s Pos_Y = @e[type=interaction,tag=_MovingPlatform_,distance=..1.75,sort=nearest,limit=1] Pos_Y run function wpm:blocks/moving-platform/tp-to_main-part
# SET MOVING-DIRECTION
    execute at @s positioned ~ ~ ~ if entity @e[tag=_MovingPlatform_,distance=..1.45,scores={Moving_dir=1,Moving_break=0}] run tag @s add Moving_UP
    execute at @s[tag=Moving_UP] positioned ~ ~ ~ unless entity @e[tag=_MovingPlatform_,distance=..1.45,scores={Moving_dir=1,Moving_break=0}] run tag @s remove Moving_UP
    execute at @s positioned ~ ~ ~ if entity @e[tag=_MovingPlatform_,distance=..1.45,scores={Moving_dir=-1,Moving_break=0}] run tag @s add Moving_DOWN
    execute at @s[tag=Moving_DOWN] positioned ~ ~ ~ unless entity @e[tag=_MovingPlatform_,distance=..1.45,scores={Moving_dir=-1,Moving_break=0}] run tag @s remove Moving_DOWN
    execute at @s positioned ~ ~ ~ if entity @e[tag=_MovingPlatform_,distance=..1.45,scores={Moving_break=1..}] run tag @s add Moving_PAUSED
    execute at @s[tag=Moving_PAUSED] positioned ~ ~ ~ unless entity @e[tag=_MovingPlatform_,distance=..1.45,scores={Moving_break=1..}] run tag @s remove Moving_PAUSED
# MAKE MOB / PLAYER RIDE THE PLATFORM UPWARDS
    execute as @e[type=!#wpm:not_mob] run function wpm:blocks/moving-platform/ride_platform
# DAMAGE MOB / PLAYER IF INSIDE THE PLATFORM (WITH CUSTOM DEATH MESSAGE)
    execute as @e[type=!#wpm:not_mob] at @s positioned ~ ~ ~ if entity @e[type=block_display,tag=MovingPlatform,tag=!Moving_UP,distance=...8] run function wpm:blocks/moving-platform/squish_damage
