## PURCHASE FUNCTIONALITY
   # UPDATE & SHOW VALUES
      execute as @e[type=text_display,tag=wpm_text2_freeze_bomb] at @s run function wpm:buy-stands/station/_panel_/update-text
   # BUTTON CLICKS
      execute as @e[type=interaction,tag=buy_button_up] at @s run execute at @e[type=text_display,tag=wpm_text2_freeze_bomb,sort=nearest,limit=1] run function wpm:buy-stands/station/_buttons_/check-up
      execute as @e[type=interaction,tag=buy_button_down] at @s run execute at @e[type=text_display,tag=wpm_text2_freeze_bomb,sort=nearest,limit=1] run function wpm:buy-stands/station/_buttons_/check-down
      execute as @e[type=interaction,tag=buy_button_confirm] at @s run execute at @e[type=text_display,tag=wpm_text2_freeze_bomb,sort=nearest,limit=1] run function wpm:buy-stands/station/_buttons_/check-confirm
   # PURCHASE
      execute as @a[tag=wpm_purchase_freeze_bomb] run function wpm:buy-stands/station/freeze-bomb/buy
