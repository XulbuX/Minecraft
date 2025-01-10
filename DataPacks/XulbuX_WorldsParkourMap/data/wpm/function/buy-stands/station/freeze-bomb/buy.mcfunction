execute if score @e[type=text_display,tag=text2_freeze_bomb,sort=nearest,limit=1] buy_price > @s ParkourPlayers_MONEY run tag @s remove purchase_freeze_bomb
scoreboard players operation @s Items_to_purchase = @s Buy_Amount
execute unless entity @s[scores={items_to_purchase=..0}] run function wpm:buy-stands/station/freeze-bomb/buy_2
scoreboard players operation @s ParkourPlayers_MONEY -= @e[type=text_display,tag=text2_freeze_bomb,sort=nearest,limit=1] Buy_Price
scoreboard players set @s buy_amount 0
tag @s remove purchase_freeze_bomb
