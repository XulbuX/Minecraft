execute if entity @s[scores={homing_ammo=1..}] run title @s actionbar ["",{"text":"[","color":"#AA00BB"},{"score":{"name":"@s","objective":"HomingAmmo"},"bold":true,"color":"#FF00FF"},{"text":"]","color":"#AA00BB"}]
execute if entity @s[scores={homing_ammo=0}] run title @s actionbar ["",{"text":"[","color":"#BB2555"},{"text":"NO AMMO","color":"#FF4088"},{"text":"]","color":"#BB2555"}]
execute if entity @s[scores={homing_ammo=-1}] run title @s actionbar ["",{"text":"[","color":"#BB8800"},{"text":"∞","color":"#FFCC00"},{"text":"]","color":"#BB8800"}]
