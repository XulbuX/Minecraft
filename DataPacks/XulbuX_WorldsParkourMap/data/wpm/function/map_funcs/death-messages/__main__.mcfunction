# CANCEL MESSAGE AFTER 5 TICKS
   execute as @a[scores={wpm_death_msg_id=0..}] run execute unless entity @s[scores={wpm_death_msg_timer=0..}] run scoreboard players set @s wpm_death_msg_timer 5
   execute as @a[scores={wpm_death_msg_id=0..,wpm_death_msg_timer=..0}] run scoreboard players reset @s wpm_death_msg_id
   execute as @a[scores={wpm_death_msg_timer=..0}] run scoreboard players reset @s wpm_death_msg_timer
# CHECK FOR DEATH AND MESSAGE TO DISPLAY
   execute as @a if score @s wpm_death_count > @s wpm_last_death_count run execute if entity @s[scores={wpm_death_msg_id=0..}] run function wpm:map_funcs/death-messages/tellraw
   execute as @a if score @s wpm_death_count > @s wpm_last_death_count run scoreboard players operation @s wpm_last_death_count = @s wpm_death_count
# DEATH AMOUNT  -  SETUP
   execute as @a unless entity @s[scores={wpm_death_count=0..}] run scoreboard players set @s wpm_death_count 0
   execute as @a unless entity @s[scores={wpm_last_death_count=0..}] run scoreboard players set @s wpm_last_death_count 0
# TURN BACK ON DEATH-MESSAGES
   gamerule showDeathMessages true
