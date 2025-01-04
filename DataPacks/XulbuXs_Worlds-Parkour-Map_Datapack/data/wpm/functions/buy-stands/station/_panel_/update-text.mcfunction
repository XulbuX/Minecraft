execute at @s if entity @p[distance=..2.5] run scoreboard players set @s Show_buy_values 1
execute at @s unless entity @p[distance=..2.5] run scoreboard players set @s Show_buy_values 0
execute at @s if entity @p[distance=..6] run scoreboard players set @s Single_buy_price 80
execute at @s if entity @p[distance=..6] run function wpm:buy-stands/station/_panel_/show_values
