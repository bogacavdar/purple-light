# ACT 2 island content, biome by biome. Shared by the DB patch and the JS data generator.
# trees: (name, colours[3], trunk, r, extra)
TREES={
 0:[('Bulut çamı',['#5a9a9a','#78b8b4','#a8dcd4'],'#6a5a5a',11,{'pine':1}),('Gök söğüdü',['#5a8ab0','#78a8d0','#a8cce8'],'#5a4a3a',12,{}),
    ('Rüzgâr meşesi',['#4a8a6a','#5ea482','#86c4a0'],'#6a4a32',13,{}),('Bulut elması',['#4a9a7a','#62b48e','#8ad0aa'],'#5a4030',11,{'fruit':'Bulut elması','fc':'#f0f4ff'})],
 1:[('Dev mantar',['#a82a2a','#c83a32','#e86a5a'],'#e8dcc0',13,{}),('Mavi mantar',['#2a4aa8','#3a62c8','#6a8ae8'],'#d8d0c0',12,{}),
    ('Spor ağacı',['#6a3a8a','#8450a8','#a878c8'],'#4a3a2a',12,{}),('Kök ağacı',['#4a5a2a','#5e7034','#7e9448'],'#3a2a1a',12,{'fruit':'Goblin eriği','fc':'#d0e040'})],
}
WOODP={'Bulut çamı':14,'Gök söğüdü':16,'Rüzgâr meşesi':18,'Bulut elması':16,'Dev mantar':20,'Mavi mantar':22,'Spor ağacı':24,'Kök ağacı':20}
WOODC={'Bulut çamı':'#c8b8a8','Gök söğüdü':'#a8b8c8','Rüzgâr meşesi':'#a88a6a','Bulut elması':'#b89a7a','Dev mantar':'#f0e4c8','Mavi mantar':'#c8d0e8','Spor ağacı':'#8a6aa8','Kök ağacı':'#6a5032'}
# plants/finds: (name, look, colours, rule, respawn, price, kind)  kind = icon family
PLANTS={
 0:[('Gök otu','herb',['#6a9ab0','#d8f0ff'],'land',50,14,'herb'),('Bulut pamuğu','bush',['#8ab8b0','#ffffff'],'land',45,12,'wool'),
    ('Rüzgâr çiçeği','herb',['#5a8a7a','#f0a0d0'],'land',55,16,'herb'),('Tüy yosunu','moss',['#a8c8c0','#e8f4f0'],'land',45,10,'moss'),
    ('Gök mantarı','mush',['#7ab0d8','#e8f4ff'],'forest',60,18,'mush'),('Yüzer taş','gem',['#8a9ab0','#d8e8ff'],'land',90,30,'gem'),
    ('Gök kumu','clay',['#c8d8e8','#f0f8ff'],'wet',60,10,'clay'),('Rüzgâr kristali','gem',['#a8e0f0','#ffffff'],'land',110,40,'gem')],
 1:[('Spor tozu','moss',['#8a6a3a','#e8c870'],'land',50,14,'dust'),('Işıldak mantarı','mush',['#5a8a3a','#c8ff70'],'forest',60,20,'mush'),
    ('Büyü otu','herb',['#4a3a7a','#b080ff'],'land',70,26,'herb'),('Goblin otu','herb',['#5a7a2a','#a0c040'],'land',50,12,'herb'),
    ('Mantar şapkası','mush',['#a83a2a','#f0e0c0'],'forest',55,16,'mush'),('Sümük yosunu','moss',['#4a8a5a','#a0f0b0'],'wet',55,14,'moss'),
    ('Dev spor','mush',['#c8a0e0','#ffffff'],'forest',80,28,'mush'),('Kök yumrusu','herb',['#6a4a2a','#c89a5a'],'land',50,14,'root')],
}
# ores: (name, label, colour, count, tier, price)
ORES={0:[('Gök demiri','Gök demiri madeni','#9ab0c8',14,2,30),('Bulut kuvarsı','Bulut kuvarsı yatağı','#e0f0ff',12,2,34),('Hafif taş','Hafif taş ocağı','#c8c0b0',16,1,12)],
      1:[('Spor kristali','Spor kristali yatağı','#c8a0ff',12,2,40),('Goblin bakırı','Goblin bakırı madeni','#d88a4a',16,1,16),('Kök taşı','Kök taşı ocağı','#7a6a4a',16,1,12)]}
# creatures: name -> dict; drops list (name,min,max,p,kind); BANIM entry (want, cond)
ANIMALS={
 0:[('Bulut koyunu',dict(temper='zararsız',hp=40,spd=40,r=7,xp=14,land='land',drops=[('Bulut koyunu eti',1,1,1,'yemek'),('Bulut yünü',1,3,.9,'zırh')]),2,None,[2,4]),
    ('Rüzgâr kuşu',dict(temper='zararsız',hp=20,spd=70,r=4,xp=10,land='land',fly=1,drops=[('Rüzgâr tüyü',1,3,1,'zırh'),('Rüzgâr kuşu eti',1,1,.8,'yemek')]),2,None,None),
    ('Kaya kertenkelesi',dict(temper='zararsız',hp=30,spd=50,r=5,xp=12,land='land',drops=[('Kertenkele pulu',1,2,.9,'zırh'),('Kertenkele eti',1,1,.8,'yemek')]),1,None,None),
    ('Gök tazısı',dict(z=1,temper='saldırgan',hp=160,spd=110,aggro=200,r=6,xp=70,dmg=34,reach=34,wind=.45,fx=['kanama',4,5],land='land',night=1,drops=[('Gök tazısı postu',1,1,.85,'zırh'),('Tazı dişi',1,2,.6,'silah')]),1,'night',[2,3]),
    ('Fırtına kartalı',dict(z=1,temper='saldırgan',hp=140,spd=100,aggro=190,r=6,xp=80,dmg=38,reach=34,wind=.5,land='land',fly=1,drops=[('Fırtına tüyü',1,3,.9,'zırh'),('Kartal pençesi',1,2,.5,'silah')]),1,'lvl',None)],
 1:[('Mantar böceği',dict(temper='zararsız',hp=40,spd=30,r=5,xp=14,land='land',drops=[('Böcek kabuğu',1,2,.9,'zanaat'),('Spor tozu',1,2,1,'zanaat')]),2,None,None),
    ('Spor salyangozu',dict(temper='zararsız',hp=50,spd=18,r=5,xp=16,land='land',drops=[('Salyangoz sümüğü',1,2,.9,'zanaat')]),2,None,None),
    ('Goblin',dict(z=1,temper='saldırgan',hp=180,spd=80,aggro=200,r=6,xp=80,dmg=36,reach=30,wind=.45,land='land',drops=[('Goblin kulağı',1,1,.8,'zanaat'),('Goblin bıçağı',1,1,.4,'silah')]),2,None,[2,4]),
    ('Goblin okçusu',dict(z=1,temper='saldırgan',hp=140,spd=70,aggro=230,r=6,xp=90,dmg=30,ranged=dict(range=200,spd=180,c='#c8a060',n=1,cd=2),land='land',drops=[('Goblin oku',1,3,.8,'silah'),('Goblin kulağı',1,1,.6,'zanaat')]),1,None,None),
    ('Goblin şamanı',dict(z=1,temper='saldırgan',hp=260,spd=60,aggro=240,r=6,xp=160,dmg=50,fx=['zehir',6,5],ranged=dict(range=210,spd=150,c='#a0f070',n=3,cd=2.6),land='land',drops=[('Şaman tüyü',1,2,.6,'zanaat'),('Büyü otu',1,2,.8,'zanaat')]),1,'lvl',None)],
}
DROPP={'Bulut koyunu eti':10,'Bulut yünü':16,'Rüzgâr tüyü':12,'Rüzgâr kuşu eti':8,'Kertenkele pulu':14,'Kertenkele eti':8,'Gök tazısı postu':60,'Tazı dişi':40,'Fırtına tüyü':40,
 'Böcek kabuğu':14,'Salyangoz sümüğü':16,'Goblin kulağı':30,'Goblin bıçağı':60,'Goblin oku':20,'Şaman tüyü':70,'Bulut elması':12,'Goblin eriği':10}
ICONK={'Bulut koyunu eti':'meat','Bulut yünü':'wool','Rüzgâr tüyü':'feather','Rüzgâr kuşu eti':'meat','Kertenkele pulu':'scale','Kertenkele eti':'meat','Gök tazısı postu':'hide','Tazı dişi':'tooth',
 'Fırtına tüyü':'feather','Böcek kabuğu':'shell','Salyangoz sümüğü':'slime','Goblin kulağı':'ear','Goblin bıçağı':'knife','Goblin oku':'arrow','Şaman tüyü':'feather','Bulut elması':'fruit','Goblin eriği':'fruit',
 'Ateş asası':'staff','Mana iksiri':'potion'}
ICONC={'Bulut koyunu eti':['#d88a7a','#f0b8a8'],'Bulut yünü':['#e8f0f8','#ffffff'],'Rüzgâr tüyü':['#a8d8e8','#ffffff'],'Rüzgâr kuşu eti':['#d07a6a','#e8a898'],'Kertenkele pulu':['#7a9a6a','#b8d0a0'],'Kertenkele eti':['#c87a6a','#e0a090'],
 'Gök tazısı postu':['#4a5a7a','#7a8aaa'],'Tazı dişi':['#e8e0d0','#ffffff'],'Fırtına tüyü':['#5a6a8a','#c8d8f0'],'Böcek kabuğu':['#6a4a2a','#a8784a'],'Salyangoz sümüğü':['#7ad0a0','#d0ffe0'],'Goblin kulağı':['#6a9a3a','#a0d060'],
 'Goblin bıçağı':['#8a8a90','#5a3a20'],'Goblin oku':['#c8a060','#8a8a90'],'Şaman tüyü':['#a0f070','#4a2a6a'],'Bulut elması':['#e8f0ff','#5a9a7a'],'Goblin eriği':['#d0e040','#6a7a2a'],
 'Ateş asası':['#6a4a2a','#ff7a2a'],'Mana iksiri':['#7a3ad8','#d8b0ff']}
# ---------------- v78: Hurda Çölü (biome 2)
TREES[2]=[('Hurda palmiyesi',['#6a7a3a','#8a9a4a','#aaba6a'],'#7a5a3a',12,{}),('Pas ağacı',['#8a4a2a','#a85a32','#c87a4a'],'#5a3a2a',12,{}),
          ('Kuru çınar',['#8a8a5a','#a0a06a','#c0c088'],'#6a5a4a',13,{}),('Hurma',['#5a7a2a','#6e8e34','#8eae48'],'#8a6a3a',12,{'fruit':'Hurma','fc':'#a8682a'})]
WOODP.update({'Hurda palmiyesi':22,'Pas ağacı':24,'Kuru çınar':24,'Hurma':22})
WOODC.update({'Hurda palmiyesi':'#b89a6a','Pas ağacı':'#a8603a','Kuru çınar':'#c8b88a','Hurma':'#a87a4a'})
PLANTS[2]=[('Hurda parçası','gem',['#7a7a80','#b8b8c0'],'land',45,10,'plate'),('Pas tozu','moss',['#a85a2a','#d88a4a'],'land',45,8,'dust'),
           ('Bakır tel','vine',['#b8683a','#e8a060'],'land',55,14,'wire'),('Çöl otu','herb',['#8a8a3a','#d8c86a'],'land',45,8,'herb'),
           ('Kaktüs meyvesi','bush',['#4a8a3a','#e85a7a'],'land',60,12,'fruit'),('Vida','gem',['#8a8a90','#d8d8e0'],'land',50,8,'screw'),
           ('Eski devre','gem',['#2a6a3a','#e8c040'],'land',90,30,'chip'),('Yağ birikintisi','clay',['#1a1a1e','#4a4a5a'],'wet',70,14,'slime')]
ORES[2]=[('Hurda yığını','Hurda yığını','#7a7a80',18,1,10),('Pirinç cevheri','Pirinç madeni','#d8b84a',14,2,24),('Barut kayası','Barut kayası','#5a5a4a',14,2,22)]
ANIMALS[2]=[('Pas böceği',dict(temper='zararsız',hp=50,spd=34,r=5,xp=16,land='land',drops=[('Dişli',1,2,.9,'zanaat'),('Pas tozu',1,2,1,'zanaat')]),2,None,None),
            ('Hurda faresi',dict(temper='zararsız',hp=30,spd=70,r=4,xp=12,land='land',drops=[('Bakır tel',1,2,.8,'zanaat'),('Vida',1,3,.9,'zanaat')]),2,None,None),
            ('Devriye robotu',dict(z=1,temper='saldırgan',hp=320,spd=70,aggro=220,r=7,xp=140,dmg=60,reach=32,wind=.5,land='land',drops=[('Robot çekirdeği',1,1,.7,'zanaat'),('Dişli',1,3,.9,'zanaat')]),2,None,[1,2]),
            ('Lazer dronu',dict(z=1,temper='saldırgan',hp=200,spd=90,aggro=240,r=6,xp=150,dmg=48,fly=1,ranged=dict(range=220,spd=260,c='#ff3a3a',n=1,cd=1.6),land='land',drops=[('Lens',1,1,.6,'zanaat'),('Pil',1,1,.7,'zanaat')]),1,None,None),
            ('Hurda devi',dict(z=1,temper='saldırgan',hp=1200,spd=34,aggro=180,r=11,xp=480,dmg=140,reach=48,wind=.8,land='land',drops=[('Motor',1,1,.8,'zanaat'),('Ağır plaka',1,2,.9,'zırh')]),1,'lvl',None)]
DROPP.update({'Dişli':18,'Robot çekirdeği':90,'Lens':60,'Pil':50,'Motor':180,'Ağır plaka':70,'Hurma':10})
ICONK.update({'Dişli':'gear','Robot çekirdeği':'chip','Lens':'gem','Pil':'battery','Motor':'motor','Ağır plaka':'plate','Hurma':'fruit',
  'Tabanca':'gun','Pompalı':'shotgun','Tabanca mermisi':'bullet','Pompalı fişeği':'shell2','Barut':'dust','Pirinç külçesi':'ingot'})
ICONC.update({'Dişli':['#8a8a90','#c8c8d0'],'Robot çekirdeği':['#2a4a8a','#5ad0ff'],'Lens':['#6ab0e0','#e8f8ff'],'Pil':['#3a3a40','#e8c040'],'Motor':['#5a5a60','#c84a2a'],'Ağır plaka':['#6a6a72','#a8a8b0'],'Hurma':['#a8682a','#5a7a2a'],
  'Tabanca':['#3a3a40','#8a6a4a'],'Pompalı':['#3a3a40','#8a5a3a'],'Tabanca mermisi':['#d8b84a','#8a6a2a'],'Pompalı fişeği':['#c84a2a','#d8b84a'],'Barut':['#3a3a3a','#8a8a8a'],'Pirinç külçesi':['#d8b84a','#f0d878']})
