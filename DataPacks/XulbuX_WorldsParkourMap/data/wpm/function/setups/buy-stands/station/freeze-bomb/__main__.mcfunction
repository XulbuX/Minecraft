## BUY ITEMS  -  SETUP
   # PLACE TEXTS
      execute as @e[type=interaction,tag=wpm_buy_station,tag=buy_freeze_bomb] run function wpm:setups/buy-stands/station/freeze-bomb/place-station
   # DELETE BUY-STATION
      execute as @e[type=interaction,tag=wpm_buy_station,tag=buy_freeze_bomb,tag=!delete] at @s run execute if entity @e[type=interaction,tag=wpm_buy_station,tag=buy_freeze_bomb,distance=.001..2] run tag @s add delete
      execute as @e[type=interaction,tag=wpm_buy_station,tag=buy_freeze_bomb,tag=delete] run function wpm:setups/buy-stands/too-close_delete
   # REMOVE TEXT
      execute as @e[type=text_display,tag=wpm_text2_freeze_bomb] at @s positioned ~ ~-1 ~ run execute unless entity @e[type=interaction,tag=wpm_buy_station,tag=buy_freeze_bomb,distance=...001] run kill @s
      execute as @e[type=text_display,tag=wpm_text1_freeze_bomb] at @s positioned ~ ~-2.25 ~ run execute unless entity @e[type=interaction,tag=wpm_buy_station,tag=buy_freeze_bomb,distance=...001] run kill @s
   # REMOVE INTERACTIONS
      execute as @e[type=interaction,tag=wpm_buy_button_up] at @s positioned ~ ~-1.475 ~ run execute unless entity @e[type=text_display,tag=wpm_text2_freeze_bomb,distance=..1.55] run kill @s
      execute as @e[type=interaction,tag=wpm_buy_button_down] at @s positioned ~ ~-1.475 ~ run execute unless entity @e[type=text_display,tag=wpm_text2_freeze_bomb,distance=..1.55] run kill @s
      execute as @e[type=interaction,tag=wpm_buy_button_confirm] at @s positioned ~ ~-1.025 ~ run execute unless entity @e[type=text_display,tag=wpm_text2_freeze_bomb,distance=..1.55] run kill @s
