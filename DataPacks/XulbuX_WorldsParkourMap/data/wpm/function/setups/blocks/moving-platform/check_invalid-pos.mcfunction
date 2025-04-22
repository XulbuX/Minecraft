execute at @s if block ~ ~.5 ~ #wpm:full_blocks run tag @s add in_wall_delete
execute at @s if block ~1 ~.5 ~ #wpm:full_blocks run tag @s add in_wall_delete
execute at @s if block ~1 ~.5 ~1 #wpm:full_blocks run tag @s add in_wall_delete
execute at @s if block ~ ~.5 ~1 #wpm:full_blocks run tag @s add in_wall_delete
execute at @s if block ~-1 ~.5 ~1 #wpm:full_blocks run tag @s add in_wall_delete
execute at @s if block ~-1 ~.5 ~ #wpm:full_blocks run tag @s add in_wall_delete
execute at @s if block ~-1 ~.5 ~-1 #wpm:full_blocks run tag @s add in_wall_delete
execute at @s if block ~ ~.5 ~-1 #wpm:full_blocks run tag @s add in_wall_delete
execute at @s if block ~1 ~.5 ~-1 #wpm:full_blocks run tag @s add in_wall_delete

execute at @s positioned ~ ~ ~ if entity @e[type=block_display,tag=wpm_moving_platform,distance=...5] run tag @s add overlap_delete
execute at @s positioned ~1 ~ ~ if entity @e[type=block_display,tag=wpm_moving_platform,distance=...5] run tag @s add overlap_delete
execute at @s positioned ~1 ~ ~1 if entity @e[type=block_display,tag=wpm_moving_platform,distance=...5] run tag @s add overlap_delete
execute at @s positioned ~ ~ ~1 if entity @e[type=block_display,tag=wpm_moving_platform,distance=...5] run tag @s add overlap_delete
execute at @s positioned ~-1 ~ ~1 if entity @e[type=block_display,tag=wpm_moving_platform,distance=...5] run tag @s add overlap_delete
execute at @s positioned ~-1 ~ ~ if entity @e[type=block_display,tag=wpm_moving_platform,distance=...5] run tag @s add overlap_delete
execute at @s positioned ~-1 ~ ~-1 if entity @e[type=block_display,tag=wpm_moving_platform,distance=...5] run tag @s add overlap_delete
execute at @s positioned ~ ~ ~-1 if entity @e[type=block_display,tag=wpm_moving_platform,distance=...5] run tag @s add overlap_delete
execute at @s positioned ~1 ~ ~-1 if entity @e[type=block_display,tag=wpm_moving_platform,distance=...5] run tag @s add overlap_delete
