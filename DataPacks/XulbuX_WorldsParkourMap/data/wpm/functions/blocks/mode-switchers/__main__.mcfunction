################################ CHECK FOR MODE-SWITCHING ##############################
# JOIN PARKOUR-MODE
   execute as @e[team=!ParkourMapPlayers] run function wpm:blocks/mode-switchers/check-join
# LEAVE PARKOUR-MODE
   execute as @e[team=ParkourMapPlayers] run function wpm:blocks/mode-switchers/check-leave

################################ MODE-SWITCHES  -  SETUP ##############################
# JOIN PARKOUR-MODE SETUP
   execute as @e[team=ParkourMapPlayers,tag=!ParkourMapPlayer,tag=!Parkour_JOIN] run tag @s add Parkour_JOIN
   execute as @e[tag=Parkour_JOIN] run function wpm:blocks/mode-switchers/setup-join
# LEAVE PARKOUR-MODE SETUP
   execute as @e[team=!ParkourMapPlayers,tag=ParkourMapPlayer] run tag @s add Parkour_RESET
   execute as @e[tag=ParkourMapPlayer,tag=Parkour_RESET] run tag @s remove ParkourMapPlayer
   execute as @e[tag=Parkour_RESET] run function wpm:blocks/mode-switchers/setup-leave

################################ CONSTANTLY RUNNING, MODE DEPENDING ##############################
# WHILE IN PARKOUR-MODE
execute as @e[team=ParkourMapPlayers] run function wpm:blocks/mode-switchers/in-mode-forcing
# WHILE NOT IN PARKOUR-MODE
execute as @e[team=!ParkourMapPlayers] run scoreboard players reset @s ParkourPlayers_HEALTH
