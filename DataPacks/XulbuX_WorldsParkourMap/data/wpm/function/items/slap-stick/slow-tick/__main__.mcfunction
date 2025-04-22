# SLAP-STICK INACTIVE
execute as @a[nbt={Inventory:[{id:"minecraft:red_candle",components:{"minecraft:custom_data":{slap_stick:1}}}]}] run execute unless entity @s[scores={wpm_slap_timer_red=400..}] run scoreboard players add @s SlapTimer_red 1
# SLAP-STICK ACTIVE
execute as @a[nbt={Inventory:[{id:"minecraft:lime_candle",components:{"minecraft:custom_data":{slap_stick:1}}}]}] run execute unless entity @s[scores={wpm_slap_timer_green=200..}] run scoreboard players add @s SlapTimer_green 1
