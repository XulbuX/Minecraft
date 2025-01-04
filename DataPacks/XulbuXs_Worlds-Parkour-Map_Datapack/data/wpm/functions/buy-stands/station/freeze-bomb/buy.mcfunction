execute if score @e[type=text_display,tag=Text2_FreezeBomb,sort=nearest,limit=1] Buy_Price > @s ParkourPlayers_MONEY run tag @s remove Purchase_FreezeBomb
scoreboard players operation @s Items_to_purchase = @s Buy_Amount
execute unless entity @s[scores={Items_to_purchase=..0}] run function wpm:buy-stands/station/freeze-bomb/buy_2
scoreboard players operation @s ParkourPlayers_MONEY -= @e[type=text_display,tag=Text2_FreezeBomb,sort=nearest,limit=1] Buy_Price
scoreboard players set @s Buy_Amount 0
tag @s remove Purchase_FreezeBomb
