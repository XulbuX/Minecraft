# COLLIDE
    execute if entity @s[tag=Collision_1] run function wpm:blocks/moving-platform/platform-collision
    execute if entity @s[tag=Collision_-1] run function wpm:blocks/moving-platform/platform-collision
# RESET Check_Blocks_2 SCOREBOARD
    scoreboard players set @s Check_Blocks_2 0
# Moving_dir = 1
    execute if entity @s[scores={Moving_dir=1}] run function wpm:blocks/moving-platform/1_check-for_platform
    execute if entity @s[scores={Moving_dir=-1,Moving_break=1}] run function wpm:blocks/moving-platform/1_check-for_platform
    execute if entity @s[scores={Check_Blocks_2=1,Moving_dir=1},tag=!Collision_1] run tag @s add Collision_1
# Moving_dir = -1
    execute if entity @s[scores={Moving_dir=-1}] run function wpm:blocks/moving-platform/-1_check-for_platform
    execute if entity @s[scores={Moving_dir=1,Moving_break=1}] run function wpm:blocks/moving-platform/-1_check-for_platform
    execute if entity @s[scores={Check_Blocks_2=1,Moving_dir=-1},tag=!Collision_-1] run tag @s add Collision_-1
# RESET Check_Blocks_2 IF COLLISION
    execute if entity @s[tag=Collision_1] run scoreboard players reset @s Check_Blocks_2
    execute if entity @s[tag=Collision_-1] run scoreboard players reset @s Check_Blocks_2
