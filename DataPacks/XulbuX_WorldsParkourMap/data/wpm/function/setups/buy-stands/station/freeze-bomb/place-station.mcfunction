execute at @s run function wpm:setups/buy-stands/station/_panel_/get_rot
execute at @s run function wpm:setups/buy-stands/station/_panel_/place_text
execute if entity @s[tag=pos_invalid] run function wpm:setups/buy-stands/invalid-pos_delete
execute at @s run function wpm:setups/buy-stands/station/_buttons_/place_buttons

execute if entity @s[tag=new] run tag @s remove new
