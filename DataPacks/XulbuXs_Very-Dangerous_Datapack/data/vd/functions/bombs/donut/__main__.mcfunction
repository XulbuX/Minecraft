# 10
   execute as @e[type=tnt,tag=DONUT_10,nbt={Fuse:1s}] at @s run summon tnt ~ ~ ~ {Fuse:50s,Motion:[0d,1.25d,0d],CustomName:'[{"text":"DONUT 10","color":"light_purple","bold":true}]',CustomNameVisible:1b,Glowing:1b,Invulnerable:1b,NoGravity:1b,Tags:["DONUT_10_Fase2","DONUT_Fase2"]}
   execute as @e[type=tnt,tag=DONUT_10_Fase2,nbt={Fuse:1s}] run function vd:bombs/donut/boom_10
# 25
   execute as @e[type=tnt,tag=DONUT_25,nbt={Fuse:1s}] at @s run summon tnt ~ ~ ~ {Fuse:50s,Motion:[0d,1.25d,0d],CustomName:'[{"text":"DONUT 25","color":"light_purple","bold":true}]',CustomNameVisible:1b,Glowing:1b,Invulnerable:1b,NoGravity:1b,Tags:["DONUT_25_Fase2","DONUT_Fase2"]}
   execute as @e[type=tnt,tag=DONUT_25_Fase2,nbt={Fuse:1s}] run function vd:bombs/donut/boom_25
# 50
   execute as @e[type=tnt,tag=DONUT_50,nbt={Fuse:1s}] at @s run summon tnt ~ ~ ~ {Fuse:50s,Motion:[0d,1.25d,0d],CustomName:'[{"text":"DONUT 50","color":"light_purple","bold":true}]',CustomNameVisible:1b,Glowing:1b,Invulnerable:1b,NoGravity:1b,Tags:["DONUT_50_Fase2","DONUT_Fase2"]}
   execute as @e[type=tnt,tag=DONUT_50_Fase2,nbt={Fuse:1s}] run function vd:bombs/donut/boom_50
# 200
   execute as @e[type=tnt,tag=DONUT_200,nbt={Fuse:1s}] at @s run summon tnt ~ ~ ~ {Fuse:50s,Motion:[0d,1.25d,0d],CustomName:'[{"text":"DONUT 200","color":"light_purple","bold":true}]',CustomNameVisible:1b,Glowing:1b,Invulnerable:1b,NoGravity:1b,Tags:["DONUT_200_Fase2","DONUT_Fase2"]}
   execute as @e[type=tnt,tag=DONUT_200_Fase2,nbt={Fuse:1s}] run function vd:bombs/donut/boom_200
# 500
   execute as @e[type=tnt,tag=DONUT_500,nbt={Fuse:1s}] at @s run summon tnt ~ ~ ~ {Fuse:50s,Motion:[0d,1.25d,0d],CustomName:'[{"text":"DONUT 500","color":"light_purple","bold":true}]',CustomNameVisible:1b,Glowing:1b,Invulnerable:1b,NoGravity:1b,Tags:["DONUT_500_Fase2","DONUT_Fase2"]}
   execute as @e[type=tnt,tag=DONUT_500_Fase2,nbt={Fuse:1s}] run function vd:bombs/donut/boom_500
# 1000
   execute as @e[type=tnt,tag=DONUT_1000,nbt={Fuse:1s}] at @s run summon tnt ~ ~ ~ {Fuse:50s,Motion:[0d,1.25d,0d],CustomName:'[{"text":"DONUT 1000","color":"light_purple","bold":true}]',CustomNameVisible:1b,Glowing:1b,Invulnerable:1b,NoGravity:1b,Tags:["DONUT_1000_Fase2","DONUT_Fase2"]}
   execute as @e[type=tnt,tag=DONUT_1000_Fase2,nbt={Fuse:1s}] run function vd:bombs/donut/boom_1000
# 5000
   execute as @e[type=tnt,tag=DONUT_5000,nbt={Fuse:1s}] at @s run summon tnt ~ ~ ~ {Fuse:50s,Motion:[0d,1.25d,0d],CustomName:'[{"text":"DONUT 5000","color":"light_purple","bold":true}]',CustomNameVisible:1b,Glowing:1b,Invulnerable:1b,NoGravity:1b,Tags:["DONUT_5000_Fase2","DONUT_Fase2"]}
   execute as @e[type=tnt,tag=DONUT_5000_Fase2,nbt={Fuse:1s}] run function vd:bombs/donut/boom_5000

# kill TNT-Fase2
   execute as @e[type=tnt,tag=DONUT_Fase2,nbt={Fuse:1s}] run kill @s