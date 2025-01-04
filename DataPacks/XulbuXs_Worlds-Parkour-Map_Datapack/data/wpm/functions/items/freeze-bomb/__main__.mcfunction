# DEFINE LAUNCHER OF THE FREEZE-BOMB
   execute as @e[type=snowball,nbt={Item:{tag:{Tags:["FreezeBomb"]}}},tag=!Launched] run function wpm:items/freeze-bomb/get-launcher
# TIMER FOR LAUNCHER-PROTECTION
   execute as @e[tag=FreezeBomb_Launcher] at @s run execute if entity @e[type=snowball,nbt={Item:{tag:{Tags:["FreezeBomb"]}}},tag=Launched,distance=..4] run scoreboard players set @s FreezeLauncher_timer 10
   execute as @e[scores={FreezeLauncher_timer=..0}] run function wpm:items/freeze-bomb/reset-scores
# DEFINE FROZEN MOBS/PLAYERS
   execute at @e[type=snowball,nbt={Item:{tag:{Tags:["FreezeBomb"]}}},tag=Launched] run execute as @e[distance=..5,tag=!FreezeBomb_Launcher,type=!#wpm:not_mob] run tag @s add Frozen
# FREEZE  -  SETUP
   execute as @e[tag=Frozen] run function wpm:items/freeze-bomb/start-freeze
# WHILE FROZEN
   execute as @e[scores={Frozen_timer=1..}] run function wpm:items/freeze-bomb/frozen
   # PLACE ICE CUBE ON FROZEN MOB/PLAYER
      execute as @e[scores={Frozen_timer=1..},tag=!Iced] at @s rotated as @s run summon block_display ~ ~ ~ {Tags:["Ice"],block_state:{Name:"minecraft:ice",Properties:{}},transformation:[1.0000f,0.0000f,0.0000f,-0.5000f,0.0000f,2.0000f,0.0000f,0.0000f,0.0000f,0.0000f,1.0000f,-0.5000f,0.0000f,0.0000f,0.0000f,1.0000f]}
      execute as @e[scores={Frozen_timer=1..},tag=!Iced] run tag @s add Iced
# AFTER FROZEN  -  SETUP
   execute as @e[scores={Frozen_timer=..0}] run function wpm:items/freeze-bomb/after-frozen
# REMOVE ICE CUBE
   execute as @e[tag=Iced] unless entity @s[scores={Frozen_timer=1..}] run tag @s remove Iced
   execute as @e[type=block_display,tag=Ice] run function wpm:items/freeze-bomb/ice
