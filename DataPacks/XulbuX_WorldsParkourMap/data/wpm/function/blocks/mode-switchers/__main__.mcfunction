################################ CHECK FOR MODE-SWITCHING ##############################
# JOIN PARKOUR-MODE
   execute as @e[team=!wpm_players] run function wpm:blocks/mode-switchers/check-join
# LEAVE PARKOUR-MODE
   execute as @e[team=wpm_players] run function wpm:blocks/mode-switchers/check-leave

################################ MODE-SWITCHES  -  SETUP ##############################
# JOIN PARKOUR-MODE SETUP
   execute as @e[team=wpm_players,tag=!wpm_player,tag=!wpm_join] run tag @s add wpm_join
   execute as @e[tag=wpm_join] run function wpm:blocks/mode-switchers/setup-join
# LEAVE PARKOUR-MODE SETUP
   execute as @e[team=!wpm_players,tag=wpm_player] run tag @s add wpm_reset
   execute as @e[tag=wpm_player,tag=wpm_reset] run tag @s remove wpm_player
   execute as @e[tag=wpm_reset] run function wpm:blocks/mode-switchers/setup-leave

################################ CONSTANTLY RUNNING, MODE DEPENDING ##############################
# WHILE IN PARKOUR-MODE
execute as @e[team=wpm_players] run function wpm:blocks/mode-switchers/in-mode-forcing
# WHILE NOT IN PARKOUR-MODE
execute as @e[team=!wpm_players] run scoreboard players reset @s wpm_players_health
