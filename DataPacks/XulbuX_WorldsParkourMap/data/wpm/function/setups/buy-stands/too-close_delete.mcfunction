execute at @s run tellraw @a[distance=..6] ["",{"text":"BUY-STATION'S TOO CLOSE TO EACHOTHER!","italic":false,"bold":true,"color":"red"},"\n",{"text":">","italic":false,"bold":false,"color":"dark_red"},{"text":" Place the Buy_Station's with a minimum\n  distance of two blocks to eachother.","italic":false,"bold":false,"color":"#CC0000"}]
execute at @s run particle dust_color_transition{from_color:[.9,.15,.3],to_color:[.3,.1,.1],scale:1} ~ ~1.5 ~ .4 .4 .4 .1 75 force @a
kill @s
