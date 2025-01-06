# TELL IF NO PERMISSION
   execute if entity @s[tag=!wpm_OP] run tellraw @s ["",{"text":"You do not have permission\nto perform this action!","color":"red"}]

execute if entity @s[tag=wpm_OP] run give @s snowball{display:{Name:'{"text":"Throwable Pig","color":"white","italic":false}'},CustomModelData:3473,pig:1b} 1
