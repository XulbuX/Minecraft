scoreboard players set @s Text_Rotation 0
execute at @s align xz unless block ~1 ~ ~ air run scoreboard players add @s Text_Rotation 1
execute at @s align xz unless block ~ ~ ~1 air run scoreboard players add @s Text_Rotation 10
execute at @s align xz unless block ~-1 ~ ~ air run scoreboard players add @s Text_Rotation 100
execute at @s align xz unless block ~ ~ ~-1 air run scoreboard players add @s Text_Rotation 1000
