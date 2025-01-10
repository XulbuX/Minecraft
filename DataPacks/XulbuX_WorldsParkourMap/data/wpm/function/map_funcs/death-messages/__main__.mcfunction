# CANCEL MESSAGE AFTER 5 TICKS
   execute as @a[scores={death_message_id=0..}] run execute unless entity @s[scores={death_message_timer=0..}] run scoreboard players set @s death_message_timer 5
   execute as @a[scores={death_message_id=0..,death_message_timer=..0}] run scoreboard players reset @s death_message_id
   execute as @a[scores={death_message_timer=..0}] run scoreboard players reset @s death_message_timer
# CHECK FOR DEATH AND MESSAGE TO DISPLAY
   execute as @a if score @s death_count > @s Last_DeathCount run execute if entity @s[scores={death_message_id=0..}] run function wpm:map_funcs/death-messages/tellraw
   execute as @a if score @s death_count > @s Last_DeathCount run scoreboard players operation @s Last_DeathCount = @s DeathCount
# DEATH AMOUNT  -  SETUP
   execute as @a unless entity @s[scores={death_count=0..}] run scoreboard players set @s death_count 0
   execute as @a unless entity @s[scores={last_death_count=0..}] run scoreboard players set @s last_death_count 0
# TURN BACK ON DEATH-MESSAGES
   gamerule showDeathMessages true
