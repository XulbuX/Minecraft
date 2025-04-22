execute if score @e[type=text_display,tag=wpm_text2_freeze_bomb,sort=nearest,limit=1] wpm_buy_price > @s wpm_players_money run tag @s remove wpm_purchase_freeze_bomb
scoreboard players operation @s wpm_items_to_purchase = @s wpm_buy_amount
execute unless entity @s[scores={wpm_items_to_purchase=..0}] run function wpm:buy-stands/station/freeze-bomb/buy_2
scoreboard players operation @s wpm_players_money -= @e[type=text_display,tag=wpm_text2_freeze_bomb,sort=nearest,limit=1] wpm_buy_price
scoreboard players set @s wpm_buy_amount 0
tag @s remove wpm_purchase_freeze_bomb
