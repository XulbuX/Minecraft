# TELEPORTATION  -  SETUP
   execute at @e[type=interaction,tag=Portal1] if entity @a[distance=.001...825] run execute as @a[distance=.001...825,tag=!PORTAL,gamemode=!spectator] run function wpm:blocks/portals/setup-1
   execute at @e[type=interaction,tag=Portal2] if entity @a[distance=.001...825] run execute as @a[distance=.001...825,tag=!PORTAL,gamemode=!spectator] run function wpm:blocks/portals/setup-2
# SAVE PLAYERS ROTATION TO SCOREBOARDS
   execute as @a[tag=tp] run function wpm:blocks/portals/store-rotation
   execute at @e[type=interaction,tag=Portal1] if entity @a[distance=...825,tag=tp1,tag=!tp2] run execute as @a[distance=...825,tag=tp1,tag=!tp2] run function wpm:blocks/portals/transfer-rotation-1
   execute at @e[type=interaction,tag=Portal2] if entity @a[distance=...825,tag=tp2,tag=!tp1] run execute as @a[distance=...825,tag=tp2,tag=!tp1] run function wpm:blocks/portals/transfer-rotation-2
# TELEPORT PLAYER (WITH SETTING ROTATION)
   execute as @e[type=interaction,tag=Portal1] at @s run execute if entity @a[distance=.001...825,tag=!tp2] run tp @a[distance=.001...825,tag=!PORTAL,gamemode=!spectator] @e[type=interaction,tag=Portal2,sort=nearest,limit=1]
   execute as @e[type=interaction,tag=Portal2] at @s run execute if entity @a[distance=.001...825,tag=!tp1] run tp @a[distance=.001...825,tag=!PORTAL,gamemode=!spectator] @e[type=interaction,tag=Portal1,sort=nearest,limit=1]
   execute at @e[type=interaction,tag=Portal1] as @a[distance=...825,tag=!PORTAL,tag=!Sound_played,gamemode=!spectator] run function wpm:blocks/portals/playsound
   execute at @e[type=interaction,tag=Portal2] as @a[distance=...825,tag=!PORTAL,tag=!Sound_played,gamemode=!spectator] run function wpm:blocks/portals/playsound
# FINISH TELEPORTATION
   execute as @a[tag=tp,tag=Sound_played] at @s run execute unless entity @e[type=interaction,tag=PORTAL,distance=...83] run tag @s remove Sound_played
   execute as @a[tag=tp] at @s run execute unless entity @e[type=interaction,tag=PORTAL,distance=...83] run tag @s remove tp
   execute as @a[tag=tp1] at @s run execute unless entity @e[type=interaction,tag=Portal2,distance=...83] run tag @s remove tp1
   execute as @a[tag=tp2] at @s run execute unless entity @e[type=interaction,tag=Portal1,distance=...83] run tag @s remove tp2
