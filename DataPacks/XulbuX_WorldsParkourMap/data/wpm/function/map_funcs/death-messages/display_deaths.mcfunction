execute as @e[team=!ParkourMapPlayers] run scoreboard players reset @s ParkourPlayers_DEATHS
execute as @e[team=ParkourMapPlayers] run execute unless entity @s[scores={ParkourPlayers_DEATHS=0..}] run scoreboard players operation @s ParkourPlayers_DEATHS = @s DeathCount
