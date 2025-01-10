execute as @e[team=!parkour_map_players] run scoreboard players reset @s parkour_players_deaths
execute as @e[team=parkour_map_players] run execute unless entity @s[scores={parkour_players_deaths=0..}] run scoreboard players operation @s ParkourPlayers_DEATHS = @s DeathCount
