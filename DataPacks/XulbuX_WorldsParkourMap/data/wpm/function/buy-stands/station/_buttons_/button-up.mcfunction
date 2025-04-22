# FREEZE BOMB
   execute if entity @e[tag=wpm_text2_freeze_bomb,scores={wpm_show_buy_values=1},distance=...001] run execute if data entity @s interaction on target run scoreboard players add @s wpm_buy_amount 1
   execute if entity @e[tag=wpm_text2_freeze_bomb,scores={wpm_show_buy_values=1},distance=...001] run execute if data entity @s interaction on target run playsound ui.button.click player @s ~ ~ ~ 1 1
   execute if entity @e[tag=wpm_text2_freeze_bomb,scores={wpm_show_buy_values=1},distance=...001] run execute if data entity @s attack on attacker run scoreboard players add @s wpm_buy_amount 1
   execute if entity @e[tag=wpm_text2_freeze_bomb,scores={wpm_show_buy_values=1},distance=...001] run execute if data entity @s attack on attacker run playsound ui.button.click player @s ~ ~ ~ 1 1
# LANDMINE
   # ...
execute if data entity @s interaction run data remove entity @s interaction
execute if data entity @s attack run data remove entity @s attack
