# TELEPORT UP / DOWN
    execute at @s if score @s Pos_Y < @e[type=interaction,tag=_MovingPlatform_,distance=..1.75,sort=nearest,limit=1] Pos_Y run tp @s ~ ~.01 ~
    execute at @s if score @s Pos_Y > @e[type=interaction,tag=_MovingPlatform_,distance=..1.75,sort=nearest,limit=1] Pos_Y run tp @s ~ ~-.01 ~
# GET Y-POS
    execute at @s store result score @s Pos_Y run data get entity @s Pos[1] 100
# CHECK FOR REPEAT
    execute at @s if score @s Pos_Y < @e[type=interaction,tag=_MovingPlatform_,distance=..1.75,sort=nearest,limit=1] Pos_Y run function wpm:blocks/moving-platform/tp-to_main-part
    execute at @s if score @s Pos_Y > @e[type=interaction,tag=_MovingPlatform_,distance=..1.75,sort=nearest,limit=1] Pos_Y run function wpm:blocks/moving-platform/tp-to_main-part
