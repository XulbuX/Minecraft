execute as @e[team=!wpm_players] run scoreboard players reset @s wpm_players_deaths
execute as @e[team=wpm_players] run execute unless entity @s[scores={wpm_players_deaths=0..}] run scoreboard players operation @s wpm_players_deaths = @s wpm_death_count
