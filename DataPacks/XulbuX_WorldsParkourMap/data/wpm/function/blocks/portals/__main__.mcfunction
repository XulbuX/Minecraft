# TELEPORTATION  -  SETUP
   execute at @e[type=interaction,tag=wpm_portal_1] if entity @a[distance=.001...825] run execute as @a[distance=.001...825,tag=!wpm_portal,gamemode=!spectator] run function wpm:blocks/portals/setup-1
   execute at @e[type=interaction,tag=wpm_portal_2] if entity @a[distance=.001...825] run execute as @a[distance=.001...825,tag=!wpm_portal,gamemode=!spectator] run function wpm:blocks/portals/setup-2
# SAVE PLAYERS ROTATION TO SCOREBOARDS
   execute as @a[tag=wpm_tp] run function wpm:blocks/portals/store-rotation
   execute at @e[type=interaction,tag=wpm_portal_1] if entity @a[distance=...825,tag=wpm_tp_1,tag=!wpm_tp_2] run execute as @a[distance=...825,tag=wpm_tp_1,tag=!wpm_tp_2] run function wpm:blocks/portals/transfer-rotation-1
   execute at @e[type=interaction,tag=wpm_portal_2] if entity @a[distance=...825,tag=wpm_tp_2,tag=!wpm_tp_1] run execute as @a[distance=...825,tag=wpm_tp_2,tag=!wpm_tp_1] run function wpm:blocks/portals/transfer-rotation-2
# TELEPORT PLAYER (WITH SETTING ROTATION)
   execute as @e[type=interaction,tag=wpm_portal_1] at @s run execute if entity @a[distance=.001...825,tag=!wpm_tp_2] run tp @a[distance=.001...825,tag=!wpm_portal,gamemode=!spectator] @e[type=interaction,tag=wpm_portal_2,sort=nearest,limit=1]
   execute as @e[type=interaction,tag=wpm_portal_2] at @s run execute if entity @a[distance=.001...825,tag=!wpm_tp_1] run tp @a[distance=.001...825,tag=!wpm_portal,gamemode=!spectator] @e[type=interaction,tag=wpm_portal_1,sort=nearest,limit=1]
   execute at @e[type=interaction,tag=wpm_portal_1] as @a[distance=...825,tag=!wpm_portal,tag=!sound_played,gamemode=!spectator] run function wpm:blocks/portals/playsound
   execute at @e[type=interaction,tag=wpm_portal_2] as @a[distance=...825,tag=!wpm_portal,tag=!sound_played,gamemode=!spectator] run function wpm:blocks/portals/playsound
# FINISH TELEPORTATION
   execute as @a[tag=wpm_tp,tag=sound_played] at @s run execute unless entity @e[type=interaction,tag=wpm_portal,distance=...83] run tag @s remove sound_played
   execute as @a[tag=wpm_tp] at @s run execute unless entity @e[type=interaction,tag=wpm_portal,distance=...83] run tag @s remove wpm_tp
   execute as @a[tag=wpm_tp_1] at @s run execute unless entity @e[type=interaction,tag=wpm_portal_2,distance=...83] run tag @s remove wpm_tp_1
   execute as @a[tag=wpm_tp_2] at @s run execute unless entity @e[type=interaction,tag=wpm_portal_1,distance=...83] run tag @s remove wpm_tp_2
