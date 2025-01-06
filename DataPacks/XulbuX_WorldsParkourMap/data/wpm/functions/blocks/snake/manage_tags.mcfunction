# ACTIVATE / DEACTIVATE / RESET SNAKE
   execute if entity @s[tag=ACTIVE,tag=RESET] run tag @s remove ACTIVE
   execute if entity @s[tag=RESET] at @s if entity @a[distance=..25] run tag @s remove RESET
   execute if entity @s[tag=!RESET] at @s unless entity @a[distance=..25] run tag @s add RESET
   execute if entity @s[tag=!RESET] at @s if entity @a[distance=..25,nbt={SelectedItem:{tag:{Tags:["SnakeBlock_Spawnegg"]}}}] run tag @s add RESET
   execute if entity @s[tag=!ACTIVE,tag=!RESET] at @s if entity @a[distance=..25] run tag @s add ACTIVE
