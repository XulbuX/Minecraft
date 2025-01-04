execute at @s if block ~ ~.5 ~ #wpm:full_blocks run tag @s add InWall_DELETE
execute at @s if block ~1 ~.5 ~ #wpm:full_blocks run tag @s add InWall_DELETE
execute at @s if block ~1 ~.5 ~1 #wpm:full_blocks run tag @s add InWall_DELETE
execute at @s if block ~ ~.5 ~1 #wpm:full_blocks run tag @s add InWall_DELETE
execute at @s if block ~-1 ~.5 ~1 #wpm:full_blocks run tag @s add InWall_DELETE
execute at @s if block ~-1 ~.5 ~ #wpm:full_blocks run tag @s add InWall_DELETE
execute at @s if block ~-1 ~.5 ~-1 #wpm:full_blocks run tag @s add InWall_DELETE
execute at @s if block ~ ~.5 ~-1 #wpm:full_blocks run tag @s add InWall_DELETE
execute at @s if block ~1 ~.5 ~-1 #wpm:full_blocks run tag @s add InWall_DELETE

execute at @s positioned ~ ~ ~ if entity @e[type=block_display,tag=MovingPlatform,distance=...5] run tag @s add Overlap_DELETE
execute at @s positioned ~1 ~ ~ if entity @e[type=block_display,tag=MovingPlatform,distance=...5] run tag @s add Overlap_DELETE
execute at @s positioned ~1 ~ ~1 if entity @e[type=block_display,tag=MovingPlatform,distance=...5] run tag @s add Overlap_DELETE
execute at @s positioned ~ ~ ~1 if entity @e[type=block_display,tag=MovingPlatform,distance=...5] run tag @s add Overlap_DELETE
execute at @s positioned ~-1 ~ ~1 if entity @e[type=block_display,tag=MovingPlatform,distance=...5] run tag @s add Overlap_DELETE
execute at @s positioned ~-1 ~ ~ if entity @e[type=block_display,tag=MovingPlatform,distance=...5] run tag @s add Overlap_DELETE
execute at @s positioned ~-1 ~ ~-1 if entity @e[type=block_display,tag=MovingPlatform,distance=...5] run tag @s add Overlap_DELETE
execute at @s positioned ~ ~ ~-1 if entity @e[type=block_display,tag=MovingPlatform,distance=...5] run tag @s add Overlap_DELETE
execute at @s positioned ~1 ~ ~-1 if entity @e[type=block_display,tag=MovingPlatform,distance=...5] run tag @s add Overlap_DELETE
