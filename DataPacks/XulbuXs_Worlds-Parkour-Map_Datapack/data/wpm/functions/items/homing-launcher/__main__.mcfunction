# DEFINE & SHOW AMMUNITION
   execute as @a unless entity @s[scores={HomingAmmo=-1..}] run scoreboard players set @s HomingAmmo 0
   execute as @a[scores={HomingMissile=1..,HomingAmmo=..0}] run execute unless entity @s[scores={HomingAmmo=-1}] run scoreboard players reset @s HomingMissile
   execute as @a[scores={HomingMissile=1..},nbt={SelectedItem:{tag:{Tags:["Homing_MissileLauncher"]}}}] run execute unless entity @s[scores={HomingAmmo=..0}] run scoreboard players remove @s HomingAmmo 1
   execute as @a[nbt={SelectedItem:{tag:{Tags:["Homing_MissileLauncher"]}}}] run function wpm:items/homing-launcher/show-ammo
# LAUNCH HOMING-MISSILE WITH DEFINED LAUNCHER
   execute as @a[scores={HomingMissile=1..},nbt={SelectedItem:{tag:{Tags:["Homing_MissileLauncher"]}}}] run function wpm:items/homing-launcher/launch
   execute as @a[scores={HomingLauncher_timer=..0}] run tag @s remove HomingMissile_Launcher
# RESET MISSILE-LAUNCH
   execute as @e[scores={HomingMissile=1..}] run scoreboard players reset @s HomingMissile
# MISSILE
   execute as @e[type=area_effect_cloud,tag=HomingMissile] run function wpm:items/homing-launcher/missile
# REMOVE TAGS NO LONGER USED
   execute as @e[tag=Target,tag=Eliminate] run tag @s remove Target
   execute as @e[tag=Eliminate] run tag @s remove Eliminate
