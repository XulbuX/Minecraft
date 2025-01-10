# FREEZE-BOMB
   execute as @s[tag=purchase_freeze_bomb] unless entity @s[scores={items_to_purchase=..0}] run give @s snowball[custom_model_data=2560001,enchantments={levels:{infinity:1}},custom_data={freeze_bomb:1},custom_name='["",{"text":"Freeze Bomb","bold":true,"color":"aqua"}]',lore=['[{"text":"Freezes all entities in","color":"#CCFFFF"}]','[{"text":"a radius of 5 blocks to","color":"#CCFFFF"}]','[{"text":"the ","color":"#CCFFFF"},{"text":"Freeze Bomb","color":"aqua"},{"text":"."},{"text":"","color":"dark_purple"}]','[{"text":"","color":"dark_purple"}]','[{"text":"No Damage","color":"#6699FF"},{"text":"","color":"dark_purple"}]','[{"text":"10s Freezing","color":"#66CCFF"}]']] 1
   execute as @s[tag=purchase_freeze_bomb] unless entity @s[scores={items_to_purchase=..0}] run scoreboard players remove @s items_to_purchase 1
# LANDMINE
   # ...
execute unless entity @s[scores={items_to_purchase=..0}] run function wpm:buy-stands/station/_panel_/give_items
