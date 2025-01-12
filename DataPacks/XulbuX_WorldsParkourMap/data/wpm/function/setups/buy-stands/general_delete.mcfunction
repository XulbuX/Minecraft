execute at @s run tellraw @a[distance=..6] ["",{"text":"BUY-STATION","italic":false,"bold":true,"color":"#F7E83B"},{"text":" was removed.","italic":false,"bold":false,"color":"green"}]
execute at @s run particle dust_color_transition{from_color:[.3,.9,.15],to_color:[.2,.3,.2],scale:1} ~ ~1.5 ~ .4 .4 .4 .1 75 force @a
kill @s
