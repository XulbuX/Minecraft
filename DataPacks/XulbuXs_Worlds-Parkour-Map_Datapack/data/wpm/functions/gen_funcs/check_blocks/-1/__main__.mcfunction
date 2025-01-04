# CHECK FOR VALID BLOCKS AT ~ ~-1 ~
   execute at @s unless entity @s[scores={Check_Blocks=1}] run function wpm:gen_funcs/check_blocks/-1/check_valid
   execute at @s unless entity @s[scores={Check_Blocks=0..1}] run function wpm:gen_funcs/check_blocks/-1/check_invalid
# CONFIRM NOT AIR AT ~ ~-1 ~
   execute at @s unless entity @s[scores={Check_Blocks=0}] if block ~ ~-.01 ~ air run scoreboard players set @s Check_Blocks -1
