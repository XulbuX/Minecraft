# CHECK FOR VALID BLOCKS AT ~ ~-1 ~
   execute at @s unless entity @s[scores={wpm_check_blocks=1}] run function wpm:gen_funcs/check_blocks/0/check_valid
   execute at @s unless entity @s[scores={wpm_check_blocks=0..1}] run function wpm:gen_funcs/check_blocks/0/check_invalid
# CONFIRM NOT AIR AT ~ ~-1 ~
   execute at @s unless entity @s[scores={wpm_check_blocks=0}] if block ~ ~.01 ~ air run scoreboard players set @s wpm_check_blocks -1
