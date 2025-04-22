# CHECK FOR DELETE
   execute as @e[type=interaction,tag=positioned,nbt={Tags:["wpm_reset_button"]}] at @s run execute unless block ~ ~ ~ #buttons run function wpm:setups/blocks/reset-button/delete
# RESET WITH CUSTOM MESSAGE
   execute as @e[type=interaction,nbt={Tags:["wpm_reset_button"]},tag=positioned] at @s run execute if block ~ ~ ~ #buttons[powered=true] run function wpm:blocks/reset-button/reset
# RESET TAG
   execute as @e[type=interaction,nbt={Tags:["wpm_reset_button"]},tag=positioned,tag=reset_done] at @s run execute if block ~ ~ ~ #buttons[powered=false] run tag @s remove reset_done
