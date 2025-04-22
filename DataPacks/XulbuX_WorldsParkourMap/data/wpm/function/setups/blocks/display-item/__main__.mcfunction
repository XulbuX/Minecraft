# CHECK FOR DELETE
   execute as @e[type=item,tag=wpm_display_item] at @s if entity @e[type=interaction,tag=wpm_deleter,distance=..1.5] run function wpm:setups/blocks/display-item/delete
# DISPLAY-ITEM  -  SETUP
   execute as @e[type=interaction,tag=wpm_display_item] at @s unless entity @e[type=item,distance=..1.5,tag=!wpm_display_item,limit=1] run function wpm:setups/blocks/display-item/no-item_delete
   execute as @e[type=interaction,tag=wpm_display_item] at @s if entity @e[type=item,distance=..1.5,tag=!wpm_display_item,limit=1] run function wpm:setups/blocks/display-item/setup
