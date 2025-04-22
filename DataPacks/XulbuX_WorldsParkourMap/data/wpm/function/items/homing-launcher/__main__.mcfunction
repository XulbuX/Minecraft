# DEFINE & SHOW AMMUNITION
   execute as @a unless entity @s[scores={wpm_homing_ammo=-1..}] run scoreboard players set @s wpm_homing_ammo 0
   execute as @a[scores={wpm_homing_missile=1..,wpm_homing_ammo=..0}] run execute unless entity @s[scores={wpm_homing_ammo=-1}] run scoreboard players reset @s wpm_homing_missile
   execute as @a[scores={wpm_homing_missile=1..},nbt={SelectedItem:{components:{"minecraft:custom_data":{homing_missile_launcher:1}}}}] run execute unless entity @s[scores={wpm_homing_ammo=..0}] run scoreboard players remove @s wpm_homing_ammo 1
   execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{homing_missile_launcher:1}}}}] run function wpm:items/homing-launcher/show-ammo
# LAUNCH HOMING-MISSILE WITH DEFINED LAUNCHER
   execute as @a[scores={wpm_homing_missile=1..},nbt={SelectedItem:{components:{"minecraft:custom_data":{homing_missile_launcher:1}}}}] run function wpm:items/homing-launcher/launch
   execute as @a[scores={wpm_homing_launcher_timer=..0}] run tag @s remove homing_missile_launcher
# RESET MISSILE-LAUNCH
   execute as @e[scores={wpm_homing_missile=1..}] run scoreboard players reset @s wpm_homing_missile
# MISSILE
   execute as @e[type=area_effect_cloud,tag=wpm_homing_missile] run function wpm:items/homing-launcher/missile
# REMOVE TAGS NO LONGER USED
   execute as @e[tag=target,tag=eliminate] run tag @s remove target
   execute as @e[tag=eliminate] run tag @s remove eliminate
