# CHECK FOR BLOCKS IN DIRECTION 'Moving_dir'
    execute if entity @s[scores={Moving_dir=1}] at @s positioned ~ ~ ~ run function wpm:gen_funcs/check_blocks/1/rad-1_flat/__main__
    execute if entity @s[scores={Moving_dir=-1}] at @s positioned ~ ~-.07 ~ run function wpm:gen_funcs/check_blocks/-1/rad-1_flat/__main__
# CHECK FOR PLATFORM COLLISION
    function wpm:blocks/moving-platform/check_collisions
# MOVE IF NO BLOCKS / PLATFORM-COLLISION IN DIRECTION 'Moving_dir'
    # Moving_dir = 1 
        # CHECK FOR REVERSE DIRECTION
            execute if entity @s[scores={Moving_dir=1,Check_Blocks=1,Moving_break=0}] run scoreboard players set @s Moving_distance 0
            execute if entity @s[scores={Moving_dir=1,Moving_distance=..0,Moving_break=0}] run function wpm:blocks/moving-platform/change-to_-1
        execute if entity @s[scores={Moving_dir=1,Check_Blocks=0,Moving_distance=1..,Moving_break=0}] at @s run tp @s ~ ~.1 ~
        execute if entity @s[scores={Moving_dir=1,Check_Blocks=0,Moving_distance=1..,Moving_break=0}] run scoreboard players remove @s Moving_distance 1
    # Moving_dir = -1
        # CHECK FOR REVERSE DIRECTION
            execute if entity @s[scores={Moving_dir=-1,Check_Blocks=1,Moving_break=0}] run function wpm:blocks/moving-platform/change-to_1
        execute if entity @s[scores={Moving_dir=-1,Check_Blocks=0,Moving_break=0}] at @s run tp @s ~ ~-.1 ~
        execute if entity @s[scores={Moving_dir=-1,Check_Blocks=0,Moving_break=0}] run scoreboard players add @s Moving_distance 1
