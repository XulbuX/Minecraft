tag @s remove riding_platform_up
tag @s remove riding_platform_levitate
# CHECK FOR PLATFORM PART AT ~ ~-.7 ~ WITH RADIUS 0.5
    execute at @s positioned ~ ~-.7 ~ if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...5] run tag @s add riding_platform_up
    execute at @s positioned ~.33 ~-.7 ~ if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...5] run tag @s add riding_platform_up
    execute at @s positioned ~.33 ~-.7 ~.33 if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...5] run tag @s add riding_platform_up
    execute at @s positioned ~ ~-.7 ~.33 if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...5] run tag @s add riding_platform_up
    execute at @s positioned ~-.33 ~-.7 ~.33 if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...5] run tag @s add riding_platform_up
    execute at @s positioned ~-.33 ~-.7 ~ if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...5] run tag @s add riding_platform_up
    execute at @s positioned ~-.33 ~-.7 ~-.33 if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...5] run tag @s add riding_platform_up
    execute at @s positioned ~ ~-.7 ~-.33 if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...5] run tag @s add riding_platform_up
    execute at @s positioned ~.33 ~-.7 ~-.33 if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...5] run tag @s add riding_platform_up
# CHECK FOR PLATFORM PART AT ~ ~-.7 ~ WITH RADIUS 0.55
    execute at @s positioned ~ ~-.7 ~ if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...55] run tag @s add riding_platform_levitate
    execute at @s positioned ~.33 ~-.7 ~ if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...55] run tag @s add riding_platform_levitate
    execute at @s positioned ~.33 ~-.7 ~.33 if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...55] run tag @s add riding_platform_levitate
    execute at @s positioned ~ ~-.7 ~.33 if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...55] run tag @s add riding_platform_levitate
    execute at @s positioned ~-.33 ~-.7 ~.33 if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...55] run tag @s add riding_platform_levitate
    execute at @s positioned ~-.33 ~-.7 ~ if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...55] run tag @s add riding_platform_levitate
    execute at @s positioned ~-.33 ~-.7 ~-.33 if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...55] run tag @s add riding_platform_levitate
    execute at @s positioned ~ ~-.7 ~-.33 if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...55] run tag @s add riding_platform_levitate
    execute at @s positioned ~.33 ~-.7 ~-.33 if entity @e[type=block_display,tag=moving_platform,tag=moving_up,distance=...55] run tag @s add riding_platform_levitate
