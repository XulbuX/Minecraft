## SUMMON THE DIFFERENT ITEM-TEXTS
# FREEZE-BOMB
   execute if entity @s[tag=buy_freeze_bomb] at @s run execute positioned ~ ~1 ~ unless entity @e[tag=text2_freeze_bomb,distance=...001] run summon text_display ~ ~ ~ {Tags:["buy_text","text2_freeze_bomb"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[.605f,.605f,.605f]},billboard:"vertical",see_through:0b,line_width:1000,alignment:"left",background:-939524096,text:'["",{"text":" Buy this special ","color":"gold"},{"text":"Race-Item","bold":true,"color":"yellow"},{"text":"! ","color":"gold"},"\\n",{"text":" >> ","color":"#5E64FF"},{"text":"Costs for one = ","color":"#7E82FF"},{"text":"$40","color":"green"},"\\n\\n",{"text":" ","color":"#DDDDDD"},{"text":"[","bold":true,"color":"dark_gray"},{"text":"▲","bold":true,"color":"#43FFAA"},{"text":"▼","bold":true,"color":"#FF004D"},{"text":"]","bold":true,"color":"dark_gray"},{"text":" ","bold":true},{"text":"Amount to buy: ","color":"#DDDDDD"},{"text":"...","color":"light_purple"},{"text":"pcs","color":"#D000D0"},"\\n",{"text":"          Total costs: ","color":"#DDDDDD"},{"text":"$","color":"#D0A600"},{"text":"...  ","color":"#FFCC00"},{"text":"$","color":"#D54848"},{"text":"...","color":"red"},"\\n",{"text":" >> ","color":"#CC3300"},{"text":"not enough money! ","color":"#FF0000"}]'}
   execute if entity @s[tag=buy_freeze_bomb] at @s run execute positioned ~ ~2.25 ~ unless entity @e[tag=text1_freeze_bomb,distance=...001] run summon text_display ~ ~ ~ {Tags:["buy_text","text1_freeze_bomb"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[.5f,.5f,.5f]},billboard:"vertical",see_through:0b,line_width:1000,alignment:"center",background:1679909532,text:'["",{"text":" The ","color":"#CCFFFF"},{"text":"Freeze Bomb","bold":true,"color":"aqua"},{"text":" is a bomb that \\n can be thrown. Every mob/player \\n that comes within a ","color":"#CCFFFF"},{"text":"radius of 5 \\n blocks","color":"#00CCFF"},{"text":" of the bomb in the air is \\n completely ","color":"#CCFFFF"},{"text":"frozen for 10 seconds","color":"#00CCFF"},{"text":". ","color":"#CCFFFF"}]'}
# LANDMINE
   # ...

## ROTATE THE BUY_TEXT
# HEIGHT OF 1 BLOCK
   # TO 90° ANGLES
      execute at @s positioned ~ ~1 ~ run execute if entity @s[scores={text_rotation=1}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[90.0f,0.0f],transformation:{translation:[0f,0f,-0.495f]},billboard:"fixed"}
      execute at @s positioned ~ ~1 ~ run execute if entity @s[scores={text_rotation=10}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[180.0f,0.0f],transformation:{translation:[0f,0f,-0.495f]},billboard:"fixed"}
      execute at @s positioned ~ ~1 ~ run execute if entity @s[scores={text_rotation=100}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[-90.0f,0.0f],transformation:{translation:[0f,0f,-0.495f]},billboard:"fixed"}
      execute at @s positioned ~ ~1 ~ run execute if entity @s[scores={text_rotation=1000}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[0.0f,0.0f],transformation:{translation:[0f,0f,-0.495f]},billboard:"fixed"}
   # TO 45° ANGLES
      execute at @s positioned ~ ~1 ~ run execute if entity @s[scores={text_rotation=11}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[135.0f,0.0f],transformation:{translation:[0f,0f,0.495f]},billboard:"fixed"}
      execute at @s positioned ~ ~1 ~ run execute if entity @s[scores={text_rotation=110}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[225.0f,0.0f],transformation:{translation:[0f,0f,0.495f]},billboard:"fixed"}
      execute at @s positioned ~ ~1 ~ run execute if entity @s[scores={text_rotation=1100}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[-45.0f,0.0f],transformation:{translation:[0f,0f,0.495f]},billboard:"fixed"}
      execute at @s positioned ~ ~1 ~ run execute if entity @s[scores={text_rotation=1001}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[45.0f,0.0f],transformation:{translation:[0f,0f,0.495f]},billboard:"fixed"}
# HEIGHT OF 2 BLOCKS
   # TO 90° ANGLES
      execute at @s positioned ~ ~2.25 ~ run execute if entity @s[scores={text_rotation=1}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[90.0f,0.0f],transformation:{translation:[0f,0f,-0.495f]},billboard:"fixed"}
      execute at @s positioned ~ ~2.25 ~ run execute if entity @s[scores={text_rotation=10}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[180.0f,0.0f],transformation:{translation:[0f,0f,-0.495f]},billboard:"fixed"}
      execute at @s positioned ~ ~2.25 ~ run execute if entity @s[scores={text_rotation=100}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[-90.0f,0.0f],transformation:{translation:[0f,0f,-0.495f]},billboard:"fixed"}
      execute at @s positioned ~ ~2.25 ~ run execute if entity @s[scores={text_rotation=1000}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[0.0f,0.0f],transformation:{translation:[0f,0f,-0.495f]},billboard:"fixed"}
   # TO 45° ANGLES
      execute at @s positioned ~ ~2.25 ~ run execute if entity @s[scores={text_rotation=11}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[135.0f,0.0f],transformation:{translation:[0f,0f,0.495f]},billboard:"fixed"}
      execute at @s positioned ~ ~2.25 ~ run execute if entity @s[scores={text_rotation=110}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[225.0f,0.0f],transformation:{translation:[0f,0f,0.495f]},billboard:"fixed"}
      execute at @s positioned ~ ~2.25 ~ run execute if entity @s[scores={text_rotation=1100}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[-45.0f,0.0f],transformation:{translation:[0f,0f,0.495f]},billboard:"fixed"}
      execute at @s positioned ~ ~2.25 ~ run execute if entity @s[scores={text_rotation=1001}] run execute as @e[tag=buy_text,distance=...001] run data merge entity @s {Rotation:[45.0f,0.0f],transformation:{translation:[0f,0f,0.495f]},billboard:"fixed"}

## INVALID POSITION
# HEIGHT OF 1 BLOCK
   execute as @s at @s positioned ~ ~1 ~ run execute unless data entity @e[tag=buy_text,distance=...001,limit=1] {billboard:"fixed"} run tag @s add pos_invalid
   execute at @s positioned ~ ~1 ~ as @e[tag=buy_text,distance=...001] run execute unless data entity @s {billboard:"fixed"} run kill @s
# HEIGHT OF 2 BLOCK
   execute as @s at @s positioned ~ ~2.25 ~ run execute unless data entity @e[tag=buy_text,distance=...001,limit=1] {billboard:"fixed"} run tag @s add pos_invalid
   execute at @s positioned ~ ~2.25 ~ as @e[tag=buy_text,distance=...001] run execute unless data entity @s {billboard:"fixed"} run kill @s
