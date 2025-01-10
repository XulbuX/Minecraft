# FREEZE BOMB
   execute if entity @e[tag=text2_freeze_bomb,scores={show_buy_values=1},distance=...001] run execute if data entity @s interaction on target run tag @s add purchase_freeze_bomb
   execute if entity @e[tag=text2_freeze_bomb,scores={show_buy_values=1},distance=...001] run execute if data entity @s interaction on target run playsound ui.button.click player @s ~ ~ ~ 1 .6
   execute if entity @e[tag=text2_freeze_bomb,scores={show_buy_values=1},distance=...001] run execute if data entity @s attack on attacker run tag @s add purchase_freeze_bomb
   execute if entity @e[tag=text2_freeze_bomb,scores={show_buy_values=1},distance=...001] run execute if data entity @s attack on attacker run playsound ui.button.click player @s ~ ~ ~ 1 .6
# LANDMINE
   # ...
execute if data entity @s interaction run data remove entity @s interaction
execute if data entity @s attack run data remove entity @s attack
