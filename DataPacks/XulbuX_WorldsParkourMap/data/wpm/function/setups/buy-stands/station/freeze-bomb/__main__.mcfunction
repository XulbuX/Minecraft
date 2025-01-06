## BUY ITEMS  -  SETUP
   # PLACE TEXTS
      execute as @e[type=interaction,tag=BuyStation,tag=Buy_FreezeBomb] run function wpm:setups/buy-stands/station/freeze-bomb/place-station
   # DELETE BUY-STATION
      execute as @e[type=interaction,tag=BuyStation,tag=Buy_FreezeBomb,tag=!Delete] at @s run execute if entity @e[type=interaction,tag=BuyStation,tag=Buy_FreezeBomb,distance=.001..2] run tag @s add Delete
      execute as @e[type=interaction,tag=BuyStation,tag=Buy_FreezeBomb,tag=Delete] run function wpm:setups/buy-stands/too-close_delete
   # REMOVE TEXT
      execute as @e[type=text_display,tag=Text2_FreezeBomb] at @s positioned ~ ~-1 ~ run execute unless entity @e[type=interaction,tag=BuyStation,tag=Buy_FreezeBomb,distance=...001] run kill @s
      execute as @e[type=text_display,tag=Text1_FreezeBomb] at @s positioned ~ ~-2.25 ~ run execute unless entity @e[type=interaction,tag=BuyStation,tag=Buy_FreezeBomb,distance=...001] run kill @s
   # REMOVE INTERACTIONS
      execute as @e[type=interaction,tag=Buy_Button_UP] at @s positioned ~ ~-1.475 ~ run execute unless entity @e[type=text_display,tag=Text2_FreezeBomb,distance=..1.55] run kill @s
      execute as @e[type=interaction,tag=Buy_Button_DOWN] at @s positioned ~ ~-1.475 ~ run execute unless entity @e[type=text_display,tag=Text2_FreezeBomb,distance=..1.55] run kill @s
      execute as @e[type=interaction,tag=Buy_Button_CONFIRM] at @s positioned ~ ~-1.025 ~ run execute unless entity @e[type=text_display,tag=Text2_FreezeBomb,distance=..1.55] run kill @s
