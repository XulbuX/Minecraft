# FREEZE BOMB
   execute if entity @e[tag=Text2_FreezeBomb,scores={Show_buy_values=1},distance=...001] run execute if data entity @s interaction on target run scoreboard players remove @s Buy_Amount 1
   execute if entity @e[tag=Text2_FreezeBomb,scores={Show_buy_values=1},distance=...001] run execute if data entity @s interaction on target run playsound ui.button.click player @s ~ ~ ~ 1 .8
   execute if entity @e[tag=Text2_FreezeBomb,scores={Show_buy_values=1},distance=...001] run execute if data entity @s attack on attacker run scoreboard players remove @s Buy_Amount 1
   execute if entity @e[tag=Text2_FreezeBomb,scores={Show_buy_values=1},distance=...001] run execute if data entity @s attack on attacker run playsound ui.button.click player @s ~ ~ ~ 1 .8
# LANDMINE
   # ...
execute if data entity @s interaction run data remove entity @s interaction
execute if data entity @s attack run data remove entity @s attack
