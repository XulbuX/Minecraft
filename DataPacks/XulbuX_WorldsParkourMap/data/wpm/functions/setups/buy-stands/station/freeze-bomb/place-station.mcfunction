execute at @s run function wpm:setups/buy-stands/station/_panel_/get_rot
execute at @s run function wpm:setups/buy-stands/station/_panel_/place_text
execute if entity @s[tag=Pos_Invalid] run function wpm:setups/buy-stands/invalid-pos_delete
execute at @s run function wpm:setups/buy-stands/station/_buttons_/place_buttons

execute if entity @s[tag=NEW] run tag @s remove NEW
