scoreboard players set @s wpm_text_rotation 0
execute at @s align xz unless block ~1 ~ ~ air run scoreboard players add @s wpm_text_rotation 1
execute at @s align xz unless block ~ ~ ~1 air run scoreboard players add @s wpm_text_rotation 10
execute at @s align xz unless block ~-1 ~ ~ air run scoreboard players add @s wpm_text_rotation 100
execute at @s align xz unless block ~ ~ ~-1 air run scoreboard players add @s wpm_text_rotation 1000
