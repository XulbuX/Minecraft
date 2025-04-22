gamemode adventure @s
effect give @s weakness infinite 1 true
effect give @s glowing infinite 255 true
effect give @s saturation infinite 255 true
attribute @s max_health base set 10
execute if entity @s[scores={wpm_players_health=11..}] run damage @s 1 cramming
tag @s add wpm_player
