# CHECK FOR REMOVING CASES
   execute as @e[type=item,tag=Display_item] at @s if block ~ ~-.15 ~ air run function wpm:blocks/display-item/no-block_delete
   execute as @e[type=item,tag=Display_item] at @s unless block ~ ~ ~ #wpm:display-item_allowed run function wpm:blocks/display-item/in-block_delete
# LACING PARTICLES
   execute as @e[type=item,tag=Display_item,tag=Play_Particles] run function wpm:blocks/display-item/particles
# NO PICKUP AND INFINITE LIFETIME
   execute as @e[type=item,tag=Display_item] run function wpm:blocks/display-item/set-attributes
