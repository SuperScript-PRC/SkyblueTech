# {"初始方向1": "z+", "初始方向2": "x+", "最大延伸": "20"}
# 以上为 高级mcfunction的文件头
# SkyblueTech 是一款拟工业科技模组数据化指令组， 您可以使用它来在原版游戏里享受科技模组的功能！
# 3号指令组标准:  
#     在开头判定机器是否处于电量充足状态, 并给予标签 full_elec
#     有此标签的机器进行一轮运行后, 若运行成功, 则给予标签 sk_success
#     该机器的所有运行结果在 该机器的专属指令块的最后 处理, 有 sk_success 标签的机器才会进行处理, 
#         这部分一般是播放粒子效果、 发音效和扣除最近电池的电量的, 处理完毕之后记得去除标签
#      可能用到的计分板:  sk_rf(电量), sk_hc(机器的最小运行间隔/缓冲), sk_type(机器种类ID)
#      ID 1=太阳能 2=电力刷石机 3=伐木机 4=采矿机 5=火力发电机 6=电炉 7=特斯拉 8=净化炉 9=磨粉机 11=种植站 12=地热 13=泵 14=筛子
#      您也可以在此基础上增加机器ID, 但是请千万记住: 不要和其它机器的ID冲突了!
#      如果你想让你自制的机器被更多人使用的话, 请提交PR至 -> http://github.com/SuperScriptHigh/SkyblueTech
# 以下列举了模板物品的标准位置坐标(如果无特殊标明, 默认都是放置于容器左上角第一格的一个物品)
# barrel - 以下为装在木桶内
# 123486 111 123468 铁锭
# 123485 111 123469 铜锭
# 123487 111 123469 金锭
# 123486 111 123470 锡锭
# 123485 111 123471 银锭
# 123487 111 123471 铅锭
# 123486 111 123472 铝锭
# 123485 111 123473 铁粉
# 123487 111 123473 铜粉
# 123486 111 123474 锡粉
# 123485 111 123475 银粉
# 123487 111 123475 铅粉
# 123486 111 123476 金粉
# 123488 111 123476 铝粉
# 123488 111 123468 粗铜
# 123488 111 123470 粗铁
# 123488 111 123472 粗金
# 123488 111 123474 远古残骸
# -
# 123481 111 123468 羊毛
# 123483 111 123468 圆石
# 123482 111 123469 砂砾
# 123481 111 123470 沙子
# 123482 111 123471 骨头
# dispenser
# 123487 111 123478 null
# 
# dropper - 以下为装在投掷器内
# 123482 111 123477 null
# 123481 111 123478 铁锭
# 123483 111 123478 铜锭
# 123482 111 123479 金锭
# 123483 111 123480 锡锭
# 123482 111 123481 银锭
# 123483 111 123482 铅锭
# 123481 111 123482 铝锭
tag @e[name=骷髅头颅] add 骷髅头
tag @e[tag=sk_ks] remove full_elec
execute @e[tag=sk_ks,scores={sk_type=6}] ~~~ tag @s add sk_noempty
execute @e[tag=sk_ks,scores={sk_type=6}] ~~~ replaceitem block ~~-4~ slot.container 0 keep minecraft:air
#[1] 电炉
tag @e[tag=sk_ks] remove sk_noempty
execute @e[tag=sk_ks,tag=sk_noempty,scores={sk_type=6}] ~~~ execute @e[r=20,tag=dc,scores={sk_rf=20}] ~~~ tag @e[tag=sk_ks,tag=有东西,scores={sk_type=6}] add full_elec
execute @e[tag=sk_ks,tag=sk_noempty,tag=full_elec,scores={sk_type=6}] ~~~ replaceitem block ~~-4~ slot.container 1 keep minecraft:coal 1 300 {"can_place_on":{"blocks":["coal_block"]}}
execute @e[tag=sk_ks,tag=sk_noempty,tag=full_elec,scores={sk_type=6}] ~~~ detect ~~-4~ minecraft:lit_blast_furnace -1 scoreboard players remove @e[c=1,tag=dc,scores={sk_rf=20..}] sk_rf 20
# 橡木伐木机
execute @e[tag=sk_ks,scores={sk_type=3}] ~~~ execute @e[r=20,c=1,tag=dc,scores={sk_rf=45..}] ~~~ tag @e[tag=sk_ks] add full_elec
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=3}] ~~~ fill 123460 110 123464 123464 120 123465 air
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=3}] ~~~ clone ~-3~4~-3~3~14~3 123460 110 123461 filtered move minecraft:log -1
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=3}] ~~~ clone ~-3~4~-3~3~14~3 123460 110 123461 filtered move minecraft:leaves
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=3}] ~~~ fill 123460 110 123464 123464 120 123465 air 0 destroy
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=3}] ~~~ fill ~-2~4~-2~2~4~2 minecraft:skull 0 replace minecraft:air
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=3}] ~~~ execute @e[y=~4,x=~-2,z=~-2,dx-4,dz=4,name="骷髅头颅",type=item,tag=树苗,c=1] ~~~ kill @e[x=123460,y=110,z=123461,dx=4,dy=10,dz=4,name=橡树苗,c=1]
#[2]
execute @e[tag=sk_ks] ~~~ execute @e[y=~4,r=3,name="骷髅头颅",type=item,c=1,tag=树苗] ~~~ setblock ~~~ minecraft:sapling
execute @e[name="骷髅头颅",type=item] ~~~ detect ~~~ minecraft:sapling -1 kill
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=3}] ~~~ execute @e[y=~4,x=~-2,z=~-2,dx-4,dz=4,name="骷髅头颅",type=item,tag=树苗,c=1] ~~~ kill @e[x=123460,y=110,z=123461,dx=4,dy=10,dz=4,name=橡树苗,c=1]
#[2]
execute @e[tag=sk_ks] ~~~ execute @e[y=~4,r=3,name="骷髅头颅",type=item,c=1,tag=树苗] ~~~ setblock ~~~ minecraft:sapling
execute @e[name="骷髅头颅",type=item] ~~~ detect ~~~ minecraft:sapling -1 kill
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=3}] ~~~ tp @e[x=123460,y=110,z=123461,dx=5,dy=10,dz=5,type=item] ~~-1~
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=3}] ~~~ tp @e[y=~-1,r=0.5,type=item] @e[c=1,r=8,tag=收集器]
execute @e[tag=sk_ks,scores={sk_type=3}] ~~~ scoreboard players remove @e[r=20,c=1,tag=dc,scores={sk_rf=45..}] sk_rf 45
execute @e[tag=sk_ks,scores={sk_type=3}] ~~~ kill @e[x=~-3，y=~3,z=~-3,dx=6,dy=3,dz=6,name="骷髅头颅",type=item]
# 特斯拉电塔  ##################################################################
execute @e[tag=sk_ks,scores={sk_type=7,sk_rf=..500}] ~~~ scoreboard players remove @e[c=1,r=16,tag=dc,scores={sk_rf=60..}] sk_rf 60
#[1]
execute @e[tag=sk_ks,scores={sk_type=3}] ~~~ scoreboard players add @s sk_rf 60
execute @e[tag=sk_ks,scores={typ=7,sk_rf=20..}] ~~~ damage @e[r=16,family=monster,y=~-4] 4 lightning
execute @e[tag=sk_ks,scores={typ=7,sk_rf=20..}] ~~~ execute @e[r=16,family=monster,y=~-4] ~~~ scoreboard players remove @e[tag=sk_ks,scores={sk_rf=3..}] sk_rf 3
# 矿物净化炉  ##################################################################
tag @e[tag=ks,scores={sk_rf=15..}] add full_elec
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ testforblocks ~~-3~~~-3~ 123488 111 123468 # 粗铜 -> 2x铜锭
#[3]
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-4~ slot.container 0 minecraft:copper_ingot 2
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ testforblocks ~~-3~~~-3~ 123488 111 123472 # 粗金 -> 2x金锭
#[3]
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-4~ slot.container 0 minecraft:gold_ingot 2
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ testforblocks ~~-3~~~-3~ 123488 111 123470 # 粗铁- > 2x铁锭
#[3]
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-4~ slot.container 0 minecraft:iron_ingot 2
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ testforblocks ~~-3~~~-3~ 123488 111 123474 # 远古残骸 -> 2x下界合金碎片
#[3]
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-4~ slot.container 0 minecraft:netherite_scrap 2
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ testforblocks ~~-3~~~-3~ 123487 111 123473 # 铜粉 -> 铜锭
#[3]
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ replaceitem block ~~-4~ slot.container 0 minecraft:copper_ingot
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ testforblocks ~~-3~~~-3~ 123485 111 123473 # 铁粉 -> 铁锭
#[3]
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-4~ slot.container 0 minecraft:iron_ingot
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ testforblocks ~~-3~~~-3~ 123487 111 123475 # 铅粉 -> 铅锭
#[3]
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ clone 123483 111 123482 123483 111 123482 ~~-4~
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ testforblocks ~~-3~~~-3~ 123486 111 123474 # 锡粉 -> 锡锭
#[3]
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ clone 123483 111 123480 123483 111 123480 ~~-4~
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ testforblocks ~~-3~~~-3~ 123488 111 123476 # 铝粉 -> 铝锭
#[3]
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ clone 123481 111 123482 123481 111 123482 ~~-4~
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ testforblocks ~~-3~~~-3~ 123485 111 123475 # 银粉 -> 银锭
#[3]
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ clone 123482 111 123481 123482 111 123481 ~~-4~
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ testforblocks ~~-3~~~-3~ 123486 111 123476 # 金粉 -> 金锭
#[3]
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=8,sk_hc=0}] ~~~ replaceitem block ~~-4~ slot.container 0 minecraft:gold_ingot
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
tag @e[tag=sk_ks] add sk_success
scoreboard players remove @e[tag=sk_ks,tag=sk_success,scores={sk_type=8}] sk_rf 15
execute @e[tag=sk_ks,tag=sk_success,scores={sk_type=8}] ~~~ particle minecraft:campfire_smoke_particle ~~-0.2~
execute @e[tag=sk_ks,tag=sk_success,scores={sk_type=8}] ~~~ setblock ~~-1~ minecraft:target
execute @e[tag=sk_ks,tag=sk_success,scores={sk_type=8}] ~~~ playsound random.fizz @a[r=20]
scoreboard players set @e[tag=sk_ks,tag=sk_success,scores={sk_type=8}] hc 8
tag @e[tag=sk_ks,tag=sk_success,scores={sk_type=8}] remove sk_success
# 种植站   ##################################################################
execute @e[tag=sk_ks,scores={sk_type=11}] ~~~ execute @e[r=20,c=1,tag=dc,scores={sk_rf=15..}] ~~~ tag @e[tag=sk_ks] add full_elec
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=11}] ~~~ clone ~-2~-2~-2~2~-2~2 123460 111 123461 filtered normal minecraft:wheat 7
#[2]
execute @e[tag=sk_ks] ~~~ fill ~-2~-2~-2~2~-2~2  minecraft:wheat 0 replace minecraft:wheat 7
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=11}] ~~~ clone ~-2~-2~-2~2~-2~2 123460 111 123461 filtered normal minecraft:potatoes 7
#[2]
execute @e[tag=sk_ks] ~~~ fill ~-2~-2~-2~2~-2~2  minecraft:potatoes 0 replace minecraft:potatoes 7
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=11}] ~~~ clone ~-2~-2~-2~2~-2~2 123460 111 123461 filtered normal minecraft:carrots 7
#[2]
execute @e[tag=sk_ks] ~~~ fill ~-2~-2~-2~2~-2~2  minecraft:carrots 0 replace minecraft:carrots 7
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=11}] ~~~ clone ~-2~-2~-2~2~-2~2 123460 111 123461 filtered normal minecraft:beetroot 7
#[2]
execute @e[tag=sk_ks] ~~~ fill ~-2~-2~-2~2~-2~2  minecraft:beetroot 0 replace minecraft:beetroot 7
tag @e[tag=ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec,scores={sk_type=11}] ~~~ clone ~-2~-2~-2~2~-2~2 123460 111 123461 filtered normal minecraft:sweet_berry_bush 7
#[2]
execute @e[tag=sk_ks] ~~~ fill ~-2~-2~-2~2~-2~2  minecraft:sweet_berry_bush 0 replace minecraft:sweet_berry_bush 7
tag @e[tag=ks] add sk_success
execute @e[tag=sk_ks,tag=sk_success,scores={sk_type=11}] 123460 110 123461 fill ~~~~5~2~5 air 0 destroy
execute @e[tag=sk_ks,tag=sk_success,scores={sk_type=11}] ~~~ tp @e[x=123460,y=110,z=123461,dx=5,dy=4,dz=5] ~~-1~
execute @e[tag=sk_ks,tag=sk_success,scores={sk_type=11}] ~~~ tp @e[y=~-1,r=1,type=item] @e[r=16,c=1,tag=收集器]
execute @e[tag=sk_ks,tag=sk_success,scores={sk_type=11}] ~~~ scoreboard players remove @e[c=1,r=16,tag=dc,scores={sk_rf=15..}] sk_rf 15
# 磨粉机   ##################################################################
execute @e[tag=sk_ks,scores={sk_type=9,sk_hc=0}] ~~~ execute @e[r=20,c=1,tag=dc,scores={sk_rf=16..}] ~~~ tag @e[tag=sk_ks] add full_elec
execute @e[tag=sk_ks,tag=full_elec] ~~~ testforblocks ~~-3~ ~~-3~ 123483 111 123468 # 圆石 -> 砂砾
#[3]
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-5~ slot.container 0 minecraft:gravel
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec] ~~~ testforblocks ~~-3~ ~~-3~ 123482 111 123469 # 砂砾 -> 沙子
#[3]
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-5~ slot.container 0 minecraft:sand
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec] ~~~ testforblocks ~~-3~ ~~-3~ 123482 111 123471 # 骨头 -> 3x骨粉
#[3]
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-5~ slot.container 0 minecraft:bone_meal 3 
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec] ~~~ testforblocks ~~-3~ ~~-3~ 123481 111 123468 # 白色羊毛 -> 3x线
#[3]
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-5~ slot.container 0 minecraft:string 3
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=full_elec] ~~~ testforblocks ~~-3~ ~~-3~ 123481 111 123470 # 沙子 -> 黏土
#[3]
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-3~ slot.container 0 minecraft:air
execute @e[tag=sk_ks] ~~~ replaceitem block ~~-5~ slot.container 0 minecraft:clay
tag @e[tag=sk_ks] add sk_success
execute @e[tag=sk_ks,tag=sk_success,scores={sk_type=9}] ~~~ scoreboard players remove @e[c=1,r=16,tag=dc,scores={sk_rf=16..}] sk_rf 16
execute @e[tag=sk_ks,tag=sk_success,scores={sk_type=9}] ~~~ particle minecraft:knockback_roar_particle ~~-3~
execute @e[tag=sk_ks,tag=sk_success,scores={sk_type=9}] ~~~ playsound block.stonecutter.use @a[r=20]
scoreboard players set @e[tag=sk_ks,tag=sk_success,scores={sk_type=9}] hc 0
tag @e[tag=sk_ks,tag=sk_success,scores={sk_type=9}] remove sk_success
