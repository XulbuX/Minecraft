# TELL IF NO PERMISSION
   execute if entity @s[tag=!wpm_op] run tellraw @s ["",{"text":"You do not have permission\nto perform this action!","italic":false,"bold":false,"color":"red"}]

execute if entity @s[tag=wpm_op] run give @s snowball[custom_name='{"text":"Throwable Fireball","italic":false,"bold":false,"color":"white"}',custom_model_data={strings:["wpm_freeze_bomb"]},custom_data={wpm_fireball:1}] 1
