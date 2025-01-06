execute if entity @s[tag=StartEnd_checked] run tag @s remove StartEnd_checked
execute if entity @s[tag=!active,tag=!ACTIVE] run tag @s add active
execute if entity @s[tag=reset] run tag @s remove reset
# CHECK FOR PLAYER PLACED BLOCK
   execute at @s[tag=!Block_placed] unless block ~ ~ ~ air run tag @s add Block_player
   execute at @s[tag=!Block_placed] if block ~ ~ ~ air run tag @s remove Block_player
# DELAY
   execute unless entity @s[scores={Snake_delay=0..}] run function wpm:blocks/snake/define_delay
   execute if entity @s[scores={Snake_delay=1..}] run scoreboard players remove @s Snake_delay 1
# TIMER
   execute unless entity @s[scores={Snake_timer=-1..}] run scoreboard players set @s Snake_timer 0
   execute if entity @s[scores={Snake_delay=0,Snake_timer=0..200}] run scoreboard players add @s Snake_timer 1
   execute if entity @s[scores={Snake_delay=0,Snake_timer=200..}] run scoreboard players set @s Snake_timer 0
   execute if entity @s[scores={Snake_delay=0,Snake_timer=0..60},tag=!Block_placed,tag=!Block_player] run function wpm:gen_funcs/set_blocks/colored_blocks/from_id
   execute if entity @s[scores={Snake_delay=0,Snake_timer=0..60},tag=!Block_placed,tag=!Block_player] run tag @s add Block_placed
   execute if entity @s[scores={Snake_delay=0,Snake_timer=61..200},tag=Block_placed,tag=!Block_player] run setblock ~ ~ ~ air
   execute if entity @s[scores={Snake_delay=0,Snake_timer=61..200},tag=Block_placed,tag=!Block_player] run tag @s remove Block_placed
