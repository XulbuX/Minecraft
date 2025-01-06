title @s subtitle ["",{"text":"ʏᴏᴜ ʟᴇꜰᴛ ᴘᴀʀᴋᴏᴜʀ ᴘʟᴀʏᴇʀ ᴍᴏᴅᴇ.","color":"#cc4631"}]
execute at @s run playsound minecraft:block.note_block.bit player @s ~ ~ ~ .5 0
title @s title ["",{"text":"🔁","color":"#cc7c31"}]
gamemode survival @s
effect clear @s saturation
effect clear @s weakness
effect clear @s glowing
attribute @s generic.max_health base set 20
effect give @s regeneration 1 255 true
tag @s remove Parkour_RESET
