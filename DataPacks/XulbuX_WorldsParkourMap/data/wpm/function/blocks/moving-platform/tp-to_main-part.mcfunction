# TELEPORT UP / DOWN
    execute at @s if score @s wpm_pos_y < @e[type=interaction,tag=_wpm_moving_platform_,distance=..1.75,sort=nearest,limit=1] wpm_pos_y run tp @s ~ ~.01 ~
    execute at @s if score @s wpm_pos_y > @e[type=interaction,tag=_wpm_moving_platform_,distance=..1.75,sort=nearest,limit=1] wpm_pos_y run tp @s ~ ~-.01 ~
# GET Y-POS
    execute at @s store result score @s wpm_pos_y run data get entity @s Pos[1] 100
# CHECK FOR REPEAT
    execute at @s if score @s wpm_pos_y < @e[type=interaction,tag=_wpm_moving_platform_,distance=..1.75,sort=nearest,limit=1] wpm_pos_y run function wpm:blocks/moving-platform/tp-to_main-part
    execute at @s if score @s wpm_pos_y > @e[type=interaction,tag=_wpm_moving_platform_,distance=..1.75,sort=nearest,limit=1] wpm_pos_y run function wpm:blocks/moving-platform/tp-to_main-part
