# CHECK FOR DELETE
   execute as @e[type=interaction,tag=Positioned,nbt={Tags:["ResetButton"]}] at @s run execute unless block ~ ~ ~ #buttons run function wpm:setups/blocks/reset-button/delete
# RESET WITH CUSTOM MESSAGE
   execute as @e[type=interaction,nbt={Tags:["ResetButton"]},tag=Positioned] at @s run execute if block ~ ~ ~ #buttons[powered=true] run function wpm:blocks/reset-button/reset
# RESET TAG
   execute as @e[type=interaction,nbt={Tags:["ResetButton"]},tag=Positioned,tag=Reset_done] at @s run execute if block ~ ~ ~ #buttons[powered=false] run tag @s remove Reset_done
