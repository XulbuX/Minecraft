# DEFINE LAUNCHER OF THE FREEZE-BOMB
   execute as @e[type=snowball,nbt={Item:{components:{"minecraft:custom_data":{wpm_freeze_bomb:1}}}},tag=!launched] run function wpm:items/freeze-bomb/get-launcher
# TIMER FOR LAUNCHER-PROTECTION
   execute as @e[tag=freeze_bomb_launcher] at @s run execute if entity @e[type=snowball,nbt={Item:{components:{"minecraft:custom_data":{wpm_freeze_bomb:1}}}},tag=launched,distance=..4] run scoreboard players set @s wpm_freeze_launcher_timer 10
   execute as @e[scores={wpm_freeze_launcher_timer=..0}] run function wpm:items/freeze-bomb/reset-scores
# DEFINE FROZEN MOBS/PLAYERS
   execute at @e[type=snowball,nbt={Item:{components:{"minecraft:custom_data":{wpm_freeze_bomb:1}}}},tag=launched] run execute as @e[distance=..5,tag=!freeze_bomb_launcher,type=!#wpm:not_mob] run tag @s add frozen
# FREEZE  -  SETUP
   execute as @e[tag=frozen] run function wpm:items/freeze-bomb/start-freeze
# WHILE FROZEN
   execute as @e[scores={wpm_frozen_timer=1..}] run function wpm:items/freeze-bomb/frozen
   # PLACE ICE CUBE ON FROZEN MOB/PLAYER
      execute as @e[scores={wpm_frozen_timer=1..},tag=!iced] at @s rotated as @s run summon block_display ~ ~ ~ {Tags:["ice"],block_state:{Name:"minecraft:ice",Properties:{}},transformation:[1.0000f,0.0000f,0.0000f,-0.5000f,0.0000f,2.0000f,0.0000f,0.0000f,0.0000f,0.0000f,1.0000f,-0.5000f,0.0000f,0.0000f,0.0000f,1.0000f]}
      execute as @e[scores={wpm_frozen_timer=1..},tag=!iced] run tag @s add iced
# AFTER FROZEN  -  SETUP
   execute as @e[scores={wpm_frozen_timer=..0}] run function wpm:items/freeze-bomb/after-frozen
# REMOVE ICE CUBE
   execute as @e[tag=iced] unless entity @s[scores={wpm_frozen_timer=1..}] run tag @s remove iced
   execute as @e[type=block_display,tag=ice] run function wpm:items/freeze-bomb/ice
