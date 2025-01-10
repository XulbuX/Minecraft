execute if entity @s[tag=start_end_checked] run tag @s remove start_end_checked
execute if entity @s[tag=!active,tag=!active] run tag @s add active
execute if entity @s[tag=reset] run tag @s remove reset
# CHECK FOR PLAYER PLACED BLOCK
   execute at @s[tag=!block_placed] unless block ~ ~ ~ air run tag @s add block_player
   execute at @s[tag=!block_placed] if block ~ ~ ~ air run tag @s remove block_player
# DELAY
   execute unless entity @s[scores={snake_delay=0..}] run function wpm:blocks/snake/define_delay
   execute if entity @s[scores={snake_delay=1..}] run scoreboard players remove @s snake_delay 1
# TIMER
   execute unless entity @s[scores={snake_timer=-1..}] run scoreboard players set @s snake_timer 0
   execute if entity @s[scores={snake_delay=0,snake_timer=0..200}] run scoreboard players add @s Snake_timer 1
   execute if entity @s[scores={snake_delay=0,snake_timer=200..}] run scoreboard players set @s snake_timer 0
   execute if entity @s[scores={snake_delay=0,snake_timer=0..60},tag=!block_placed,tag=!block_player] run function wpm:gen_funcs/set_blocks/colored_blocks/from_id
   execute if entity @s[scores={snake_delay=0,snake_timer=0..60},tag=!block_placed,tag=!block_player] run tag @s add block_placed
   execute if entity @s[scores={snake_delay=0,snake_timer=61..200},tag=block_placed,tag=!block_player] run setblock ~ ~ ~ air
   execute if entity @s[scores={snake_delay=0,snake_timer=61..200},tag=block_placed,tag=!block_player] run tag @s remove block_placed
