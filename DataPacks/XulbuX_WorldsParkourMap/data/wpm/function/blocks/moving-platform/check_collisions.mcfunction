# COLLIDE
    execute if entity @s[tag=collision_1] run function wpm:blocks/moving-platform/platform-collision
    execute if entity @s[tag=collision__1] run function wpm:blocks/moving-platform/platform-collision
# RESET Check_Blocks_2 SCOREBOARD
    scoreboard players set @s wpm_check_blocks_2 0
# Moving_dir = 1
    execute if entity @s[scores={wpm_moving_dir=1}] run function wpm:blocks/moving-platform/1_check-for_platform
    execute if entity @s[scores={wpm_moving_dir=-1,wpm_moving_break=1}] run function wpm:blocks/moving-platform/1_check-for_platform
    execute if entity @s[scores={wpm_check_blocks_2=1,wpm_moving_dir=1},tag=!collision_1] run tag @s add collision_1
# Moving_dir = -1
    execute if entity @s[scores={wpm_moving_dir=-1}] run function wpm:blocks/moving-platform/-1_check-for_platform
    execute if entity @s[scores={wpm_moving_dir=1,wpm_moving_break=1}] run function wpm:blocks/moving-platform/-1_check-for_platform
    execute if entity @s[scores={wpm_check_blocks_2=1,wpm_moving_dir=-1},tag=!collision__1] run tag @s add collision__1
# RESET Check_Blocks_2 IF COLLISION
    execute if entity @s[tag=collision_1] run scoreboard players reset @s wpm_check_blocks_2
    execute if entity @s[tag=collision__1] run scoreboard players reset @s wpm_check_blocks_2
