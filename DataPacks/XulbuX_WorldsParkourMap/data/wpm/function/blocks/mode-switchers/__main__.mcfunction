################################ CHECK FOR MODE-SWITCHING ##############################
# JOIN PARKOUR-MODE
   execute as @e[team=!parkour_map_players] run function wpm:blocks/mode-switchers/check-join
# LEAVE PARKOUR-MODE
   execute as @e[team=parkour_map_players] run function wpm:blocks/mode-switchers/check-leave

################################ MODE-SWITCHES  -  SETUP ##############################
# JOIN PARKOUR-MODE SETUP
   execute as @e[team=parkour_map_players,tag=!parkour_map_player,tag=!parkour_join] run tag @s add parkour_join
   execute as @e[tag=parkour_join] run function wpm:blocks/mode-switchers/setup-join
# LEAVE PARKOUR-MODE SETUP
   execute as @e[team=!parkour_map_players,tag=parkour_map_player] run tag @s add parkour_reset
   execute as @e[tag=parkour_map_player,tag=parkour_reset] run tag @s remove parkour_map_player
   execute as @e[tag=parkour_reset] run function wpm:blocks/mode-switchers/setup-leave

################################ CONSTANTLY RUNNING, MODE DEPENDING ##############################
# WHILE IN PARKOUR-MODE
execute as @e[team=parkour_map_players] run function wpm:blocks/mode-switchers/in-mode-forcing
# WHILE NOT IN PARKOUR-MODE
execute as @e[team=!parkour_map_players] run scoreboard players reset @s parkour_players_health
