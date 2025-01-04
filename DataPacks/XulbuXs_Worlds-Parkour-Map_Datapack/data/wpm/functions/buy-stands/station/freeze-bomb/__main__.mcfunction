## PURCHASE FUNCTIONALITY
   # UPDATE & SHOW VALUES
      execute as @e[type=text_display,tag=Text2_FreezeBomb] at @s run function wpm:buy-stands/station/_panel_/update-text
   # BUTTON CLICKS
      execute as @e[type=interaction,tag=Buy_Button_UP] at @s run execute at @e[type=text_display,tag=Text2_FreezeBomb,sort=nearest,limit=1] run function wpm:buy-stands/station/_buttons_/check-up
      execute as @e[type=interaction,tag=Buy_Button_DOWN] at @s run execute at @e[type=text_display,tag=Text2_FreezeBomb,sort=nearest,limit=1] run function wpm:buy-stands/station/_buttons_/check-down
      execute as @e[type=interaction,tag=Buy_Button_CONFIRM] at @s run execute at @e[type=text_display,tag=Text2_FreezeBomb,sort=nearest,limit=1] run function wpm:buy-stands/station/_buttons_/check-confirm
   # PURCHASE
      execute as @a[tag=Purchase_FreezeBomb] run function wpm:buy-stands/station/freeze-bomb/buy
