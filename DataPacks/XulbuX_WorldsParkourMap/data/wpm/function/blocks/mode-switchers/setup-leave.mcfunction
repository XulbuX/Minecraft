title @s subtitle ["",{"text":"ʏᴏᴜ ʟᴇꜰᴛ ᴘᴀʀᴋᴏᴜʀ ᴘʟᴀʏᴇʀ ᴍᴏᴅᴇ.","italic":false,"bold":false,"color":"#CC4631"}]
execute at @s run playsound minecraft:block.note_block.bit player @s ~ ~ ~ .5 0
title @s title ["",{"text":"🔁","italic":false,"bold":false,"color":"#CC7C31"}]
gamemode survival @s
effect clear @s saturation
effect clear @s weakness
effect clear @s glowing
attribute @s max_health base set 20
effect give @s regeneration 1 255 true
tag @s remove wpm_reset
