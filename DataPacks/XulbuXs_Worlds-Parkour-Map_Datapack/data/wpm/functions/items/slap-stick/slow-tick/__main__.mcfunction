# SLAP-STICK INACTIVE
execute as @a[nbt={Inventory:[{id:"minecraft:red_candle",tag:{Tags:["SlapStick"]}}]}] run execute unless entity @s[scores={SlapTimer_red=400..}] run scoreboard players add @s SlapTimer_red 1
# SLAP-STICK ACTIVE
execute as @a[nbt={Inventory:[{id:"minecraft:lime_candle",tag:{Tags:["SlapStick"]}}]}] run execute unless entity @s[scores={SlapTimer_green=200..}] run scoreboard players add @s SlapTimer_green 1
