title @s subtitle ["",{"text":"ʏᴏᴜ ᴊᴏɪɴᴇᴅ ᴘᴀʀᴋᴏᴜʀ ᴘʟᴀʏᴇʀ ᴍᴏᴅᴇ.","italic":false,"bold":false,"color":"#39AFAF"}]
execute at @s run playsound minecraft:block.note_block.bit player @s ~ ~ ~ .5 1
title @s title ["",{"text":"🔁","italic":false,"bold":false,"color":"#3EBB75"}]
tag @s remove parkour_join
