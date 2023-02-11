# {"初始方向1": "z+", "初始方向2": "x+", "最大延伸": "20"}
# 蔚蓝科技 SkyblueTech by SuperScript - 1s LOOP Part
# ID 1=太阳能 2=电力刷石机 3=伐木机 4=采矿机 5=火力发电机 6=电炉 7=特斯拉 8=净化炉 9=磨粉机 11=种植站 12=地热 13=泵 14=筛子
# Running Part
#
execute @e[tag=sk_dc] ~~~ titleraw @a[r=3] actionbar {"rawtext":[{"text":"§l§a电池\n§r§e⚡§b存储能量： §e"},{"score":{"name":"@s","objective":"sk_rf"}},{"text":"."},{"score":"@s","objective":"sk_mrf"},{"text":" RF\n§4⚡§a电池电流： §c"},{"score":{"name":"@s","objective":"sk_A"}},{"text":"."},{"score":{"name":"@s","objective":"sk_rf检测m"}},{"text":" A\n§9§oSkyblue Tech              §a"}]}
execute @e[tag=收集器] ~~~ title @a[y=~-1,r=2] actionbar §2物品收集装置\n§a自动从各种机器的输出区收集物品\n§9§oSkyblue Tech              §a
execute @e[scores={sk_type=1}] ~~-3~ titleraw @a[r=3] actionbar {"rawtext":[{"text":"§b基础太阳能电池板\n§e⚡§a输出功率： "},{"score":{"name":"tyn","objective":"sk_rf"}},{"text":"x0.1 RF/s\n§9§oSkyblue Tech              §a"}]}
execute @e[scores={sk_type=2}] ~~-2~ titleraw @a[r=4] actionbar {"rawtext":[{"text":"§7电力刷石机\n§e⚡§b电量： "},{"score":{"name":"@s","objective":"sk_rf"}},{"text":" RF\n§9§oSkyblue Tech              §a"}]}
execute @e[scores={sk_type=3}] ~~-2~ titleraw @a[r=4] actionbar {"rawtext":[{"text":"§a电力伐木机\n§e⚡§a电量： "},{"score":{"name":"@s","objective":"sk_rf"}},{"text":" RF\n§9§oSkyblue Tech              §a"}]}
execute @e[scores={sk_type=4}] ~~~ titleraw @a[r=4] actionbar {"rawtext":[{"text":"§l§d初级采矿机\n§e⚡§b电量： §e"},{"score":{"name":"@e[c=1,tag=sk_dc,r=16]","objective":"sk_rf"}},{"text":"RF\n§6缓冲： §c20s\n§9§oSkyblue Tech              §a"}]}
execute @e[scores={sk_type=5, sk_time1=..82}] ~~~ detect ~~-1~ minecraft:lit_furnace -1 title @a[r=4] actionbar §c火力发电机\n§e⚡§6输出： §a1.0 §cRF/s\n§4请勿把熔岩或煤炭块作为燃料\n§9§oSkyblue Tech              §a
execute @e[scores={sk_type=5, sk_time1=..82}] ~~~ detect ~~-1~ minecraft:furnace -1 title @a[r=4] actionbar §c火力发电机\n§e⚡§6输出： §a0.0 §cRF/s\n§4请勿把熔岩或煤炭块作为燃料\n§9§oSkyblue Tech              §a
execute @e[scores={sk_type=5, sk_time1=82..}] ~~~ detect ~~-1~ minecraft:lit_furnace -1 title @a[r=4] actionbar §c火力发电机\n§e⚡§6输出： §a0.0 §cRF/s\n§4！机器过热， 无法继续发电！\n§9§oSkyblue Tech              §a
execute @e[scores={sk_type=6}] ~~-2~ titleraw @a[r=4] actionbar {"rawtext":[{"text":"§e电炉\n⚡§a电量： "},{"score":{"name":"@s","objective":"sk_rf"}},{"text":" RF\n§9§oSkyblue Tech              §a"}]}
execute @e[scores={sk_type=7}] ~~~ titleraw @a[r=4] actionbar {"rawtext":[{"text":"§6§l特斯拉高压塔\n§r§e⚡§b单体电量： §c"}, {"score":{"name":"@s","objective":"sk_rf"},{"text":" RF\n⚡§5当前电流： "},{"score":{"name":"@s","objective":"sk_A"}},{"text":"."},{"score":{"name":"@s","objective":"sk_mrf"}},{"text":" A\n§a范围怪物： §e"},{"selector":"@e[r=16,family=monster]"},{"text":"\n§9§oSkyblue Tech              §a"}}]}
execute @e[scores={sk_type=8}] ~~-3~ titleraw @a[r=3] actionbar {"rawtext":[{"text":"§3矿物净化炉\n§r§e⚡§b电量： §c"}, {"score":{"name":"@s","objective":"sk_rf"},{"text":" RF\n§9§oSkyblue Tech              §a"}}]}
execute @e[scores={sk_type=9}] ~~-3~ titleraw @a[r=3] actionbar {"rawtext":[{"text":"§g§l磨粉机\n§r§e⚡§a电量： §c"}, {"score":{"name":"@s","objective":"sk_rf"},{"text":" RF\n§9§oSkyblue Tech              §a"}}]}
execute @e[scores={sk_type=11}] ~~-3~ titleraw @a[r=3] actionbar {"rawtext":[{"text":"§2种植站\n§r§e⚡§a电量： §c"}, {"score":{"name":"@s","objective":"sk_rf"},{"text":" RF\n§9§oSkyblue Tech              §a"}}]}
execute @e[scores={sk_type=13}] ~~-3~ titleraw @a[r=3] actionbar {"rawtext":[{"text":"§f§l电动泵\n§r§e⚡§a电量： §c"}, {"score":{"name":"@s","objective":"sk_rf"},{"text":" RF\n§9§oSkyblue Tech              §a"}}]}
execute @e[scores={sk_type=13}] ~~-3~ titleraw @a[r=3] actionbar {"rawtext":[{"text":"§b自动筛矿机\n§r§e⚡§a电量： §c"}, {"score":{"name":"@s","objective":"sk_rf"},{"text":" RF\n§9§oSkyblue Tech              §a"}}]}
execute @e[scores={sk_type=13}] ~~-3~ titleraw @a[r=3] actionbar {"rawtext":[{"text":"§b热力蒸馏塔\n§r§6热量： §c"}, {"score":{"name":"@s","objective":"sk_k"}},{"text":" K\n§r§b水量： §9"}, {"score":{"name":"@s","objective":"sk_water"},{"text":" L\n§9§oSkyblue Tech              §a"}}]}
# running
execute @e[tag=sk_dc,scores={sk_rf=10001..}] ~~~ scoreboard players add @e[r=16,c=1,tag=sk_dc,scores={sk_rf=..9900}] sk_rf 100
execute @e[scores={sk_type=1}] ~~~ scoreboard players operation @e[c=1,tag=sk_dc,r=16] sk_mrf += tyn sk_rf
execute @e[scores={sk_rf=5..,sk_type=2}] ~~~ detect ~~2~ minecraft:cobblestone -1 setblock ~~2~ air 0 destroy
execute @e[scores={sk_rf=5..,sk_type=2}] ~~~ detect ~~1~ air -1 scoreboard players remove @s sk_rf 5
execute @e[scores={sk_type=5}] ~~~ detect ~~-2~ minecraft:lit_furnace -1 scoreboard players add @s  sk_time1 1
execute @e[scores={sk_type=5}] ~~~ detect ~~-2~ minecraft:furnace -1 scoreboard players set @s  sk_time1 0
execute @e[scores={sk_type=2}] ~~~ tp @e[dy=3,name=圆石,type=item] ~~-2~
execute @e[scores={sk_type=5}] ~~~ detect ~~-2~ minecraft:furnace -1 replaceitem block ~~-2~ slot.container 0 minecraft:iron_hoe 1 10000
execute @e[scores={sk_type=5, sk_time1=..82}] ~~~ detect ~~-2~ minecraft:lit_furnace -1 scoreboard players add @e[c=1,tag=sk_dc] sk_rf 1
execute @e[scores={sk_type=12,sk_hc=1..}] ~~~ scoreboard players add @e[r=16,c=1,tag=sk_dc] sk_rf 7
execute @e[scores={sk_type=12,sk_hc=1..}] ~~~ particle minecraft:cauldron_explosion_emitter ~~-2~
execute @e[scores={sk_type=12,sk_hc=1..}] ~~~ playsound fire.fire @a[r=15]
execute @e[scores={sk_type=13,sk_hc=1..}] ~~~ playsound mob.drowned.say_water @a[r=15]
# computing
execute @e[scores={sk_mrf=100..}] ~~~ scoreboard players add @s sk_rf 10
execute @e[scores={sk_mrf=10..}] ~~~ scoreboard players add @s sk_rf 1
execute @e[scpres={sk_mrf=1..}] ~~~ scoreboard players operation @s sk_rf检测 -= @s rf
execute @e[scpres={sk_mrf=1..}] ~~~ scoreboard players operation @s sk_rf检测 *= 负 sk_rf检测m
execute @e[scores={sk_mrf=1..}] ~~~ scoreboard players operation @s sk_A = @s sk_rf检测
execute @e[scores={sk_mrf=1..}] ~~~ scoreboard players operation @s sk_A /= 十 sk_rf检测
execute @e[scores={sk_mrf=1..}] ~~~ scoreboard players operation @s sk_rf检测m = @s sk_rf检测
execute @e[scores={sk_rf检测m=!0}] ~~~ scoreboard players operation @s sk_rf检测m %= 十 sk_rf检测
execute @e[scores={sk_rf=1..}] ~~~ scoreboard players operation @s sk_rf检测 = @s rf
execute @e[scores={sk_rf检测m=!0}] ~~~ scoreboard players operation @s sk_rf检测m %= 十 sk_rf检测
#
scoreboard players remove @e[scores={sk_mrf=100..}] sk_mrf 100
scoreboard players remove @e[scores={sk_mrf=10..}] sk_mrf 10
scoreboard players remove @e[scores={sk_hc=1..}] sk_hc 1
scoreboard players remove @e[scores={sk_hc1=1..}] sk_hc1 1
scoreboard players remove @e[tag=sk_dc,scores={sk_rf=10001..}] sk_rf 100
scoreboard players set @e[tag=火力] sk_type 5
scoreboard players reset @e[tag=火力,scores={sk_type=5}] sk_type
scoreboard question
