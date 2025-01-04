# AS AT PLAYER

summon pig ^ ^ ^0.5 {Tags:["player"]}

playsound minecraft:entity.ender_dragon.flap player @a ~ ~ ~ 1 1.2
playsound minecraft:entity.piglin.angry player @a ~ ~ ~ 0.8 1

kill @e[type=snowball,nbt={Item:{tag:{pig:1b}}},sort=nearest,limit=1]
