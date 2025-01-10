# TELEPORTATION  -  SETUP
   execute at @e[type=interaction,tag=portal1] if entity @a[distance=.001...825] run execute as @a[distance=.001...825,tag=!portal,gamemode=!spectator] run function wpm:blocks/portals/setup-1
   execute at @e[type=interaction,tag=portal2] if entity @a[distance=.001...825] run execute as @a[distance=.001...825,tag=!portal,gamemode=!spectator] run function wpm:blocks/portals/setup-2
# SAVE PLAYERS ROTATION TO SCOREBOARDS
   execute as @a[tag=tp] run function wpm:blocks/portals/store-rotation
   execute at @e[type=interaction,tag=portal1] if entity @a[distance=...825,tag=tp1,tag=!tp2] run execute as @a[distance=...825,tag=tp1,tag=!tp2] run function wpm:blocks/portals/transfer-rotation-1
   execute at @e[type=interaction,tag=portal2] if entity @a[distance=...825,tag=tp2,tag=!tp1] run execute as @a[distance=...825,tag=tp2,tag=!tp1] run function wpm:blocks/portals/transfer-rotation-2
# TELEPORT PLAYER (WITH SETTING ROTATION)
   execute as @e[type=interaction,tag=portal1] at @s run execute if entity @a[distance=.001...825,tag=!tp2] run tp @a[distance=.001...825,tag=!portal,gamemode=!spectator] @e[type=interaction,tag=portal2,sort=nearest,limit=1]
   execute as @e[type=interaction,tag=portal2] at @s run execute if entity @a[distance=.001...825,tag=!tp1] run tp @a[distance=.001...825,tag=!portal,gamemode=!spectator] @e[type=interaction,tag=portal1,sort=nearest,limit=1]
   execute at @e[type=interaction,tag=portal1] as @a[distance=...825,tag=!portal,tag=!sound_played,gamemode=!spectator] run function wpm:blocks/portals/playsound
   execute at @e[type=interaction,tag=portal2] as @a[distance=...825,tag=!portal,tag=!sound_played,gamemode=!spectator] run function wpm:blocks/portals/playsound
# FINISH TELEPORTATION
   execute as @a[tag=tp,tag=sound_played] at @s run execute unless entity @e[type=interaction,tag=portal,distance=...83] run tag @s remove sound_played
   execute as @a[tag=tp] at @s run execute unless entity @e[type=interaction,tag=portal,distance=...83] run tag @s remove tp
   execute as @a[tag=tp1] at @s run execute unless entity @e[type=interaction,tag=portal2,distance=...83] run tag @s remove tp1
   execute as @a[tag=tp2] at @s run execute unless entity @e[type=interaction,tag=portal1,distance=...83] run tag @s remove tp2
