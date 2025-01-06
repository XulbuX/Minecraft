# CANCEL MESSAGE AFTER 5 TICKS
   execute as @a[scores={DeathMessage_ID=0..}] run execute unless entity @s[scores={DeathMessage_timer=0..}] run scoreboard players set @s DeathMessage_timer 5
   execute as @a[scores={DeathMessage_ID=0..,DeathMessage_timer=..0}] run scoreboard players reset @s DeathMessage_ID
   execute as @a[scores={DeathMessage_timer=..0}] run scoreboard players reset @s DeathMessage_timer
# CHECK FOR DEATH AND MESSAGE TO DISPLAY
   execute as @a if score @s DeathCount > @s Last_DeathCount run execute if entity @s[scores={DeathMessage_ID=0..}] run function wpm:map_funcs/death-messages/tellraw
   execute as @a if score @s DeathCount > @s Last_DeathCount run scoreboard players operation @s Last_DeathCount = @s DeathCount
# DEATH AMOUNT  -  SETUP
   execute as @a unless entity @s[scores={DeathCount=0..}] run scoreboard players set @s DeathCount 0
   execute as @a unless entity @s[scores={Last_DeathCount=0..}] run scoreboard players set @s Last_DeathCount 0
# TURN BACK ON DEATH-MESSAGES
   gamerule showDeathMessages true
