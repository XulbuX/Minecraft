# FREEZE-BOMB
   execute as @s[tag=Purchase_FreezeBomb] unless entity @s[scores={Items_to_purchase=..0}] run give @s snowball{CustomModelData:2560001,Enchantments:[{id:"infinity",lvl:1}],HideFlags:1,Tags:["FreezeBomb"],display:{Name:'[{"text":"Freeze Bomb","bold":true,"color":"aqua"}]',Lore:['[{"text":"Freezes all entities in","color":"#CCFFFF"}]','[{"text":"a radius of 5 blocks to","color":"#CCFFFF"}]','[{"text":"the ","color":"#CCFFFF"},{"text":"Freeze Bomb","color":"aqua"},{"text":"."},{"text":"","color":"dark_purple"}]','[{"text":"","color":"dark_purple"}]','[{"text":"No Damage","color":"#6699FF"},{"text":"","color":"dark_purple"}]','[{"text":"10s Freezing","color":"#66CCFF"}]']}} 1
   execute as @s[tag=Purchase_FreezeBomb] unless entity @s[scores={Items_to_purchase=..0}] run scoreboard players remove @s Items_to_purchase 1
# LANDMINE
   # ...
execute unless entity @s[scores={Items_to_purchase=..0}] run function wpm:buy-stands/station/_panel_/give_items
