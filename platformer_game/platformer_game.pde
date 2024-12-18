import fisica.*;
FWorld world;
FPlayer player;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;
ArrayList<FBox> projectiles;
int L, R;

float zoom = 0.8;
color grass = #000000;
color grassWall = #3E3E3E;
color dirt = #646764;
color tram = #FF0000;
color ice = #0000FF;
color spike = #EAFF08;
color treetrunk = #08FF2E;
color treeleaf = #34FF9E;
color treecenter = #47FCA6;
color bridge = #898989;
color lava = #8B0D0D;
color goomba = #640000;
color thwomp = #86A1FF;
color koopa = #006444;
color boo = #046400;
color hammerguy = #190064;
boolean wkey,akey,skey,dkey,upkey,downkey,rightkey,leftkey, ekey, spacekey, flyMode,onGround;
PImage map;
int lives = 3;
int gridSize = 32;
void setup(){
  size(1000,1000);
  Fisica.init(this);
  world = new FWorld(-2000,-2000,10000,2000);
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();
  projectiles = new ArrayList<FBox>();
  world.setGravity(0,900);
  L = -1;
  R = 1;
  flyMode = false;
  loadMap();
  loadPlayer();
}

void draw(){
  background(#CFFBFC);
  drawWorld();
  

}
void drawWorld(){
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2); 
  scale(zoom);
  world.step();
  world.draw();
  actWorld();
  popMatrix();
  
}
void actWorld(){
  player.action();
  for(int i =0; i< terrain.size(); i++){
    FGameObject obj = terrain.get(i);
    if(obj.getY()+obj.getHeight()/2 >= 2000) world.remove(obj);
    obj.action();
    
  }
  for(int i = 0; i < enemies.size(); i++){
   FGameObject obj = enemies.get(i);
   if(obj.getY()+obj.getHeight()/2 >= 2000) world.remove(obj);
   obj.action();
    
  }
  for(int i =0; i< projectiles.size(); i++){
    FBox obj = projectiles.get(i);
    if(obj.getY()+obj.getHeight()/2 >= 2000) world.remove(obj);
    
    
  }
}
void loadPlayer(){
  player = new FPlayer();
  world.add(player);
  
  
}
void loadMap(){
  map = loadImage("map.png");
  for(int y = 0; y < map.height; y++){
    for(int x  =0;x< map.width; x++){
      color c = map.get(x,y);
      if(c == grass){
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        PImage p = loadImage("dirt_n.png");
         b.attachImage(p);
        b.setStatic(true);
        b.setName("ground");
        b.setFriction(4);
        world.add(b);
      }else if(c == grassWall){
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        PImage p = loadImage("dirt_n.png");
         b.attachImage(p);
        b.setStatic(true);
        b.setName("wall");
        b.setFriction(4);
        world.add(b);
      
      
      
      }else if(c == dirt){
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        PImage p = loadImage("dirt_center.png");
        b.attachImage(p);
        b.setStatic(true);
        b.setName("dirt");
        world.add(b);
      
      }else if(c== ice){
        PImage p = loadImage("water4.png");
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        b.attachImage(p);
        b.setFriction(0.5);
        b.setStatic(true);
        b.setName("ice");
        world.add(b);
        
      }else if(c== tram){
        PImage p = loadImage("trampoline.png");
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        b.attachImage(p);
        b.setStatic(true);
        b.setRestitution(2);
        b.setName("ground");
        world.add(b);
        
      }else if(c == spike){
        PImage p = loadImage("spike.png");
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        b.attachImage(p);
        b.setStatic(true);
        b.setName("harm");
        world.add(b);
        
      }else if (c == treetrunk){
        PImage p = loadImage("pipetop.png");
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        b.attachImage(p);
        b.setSensor(true);
        b.setStatic(true);
        b.setName("background");
        world.add(b);
        
     }else if (c == treeleaf){
       PImage p = loadImage("pipetrunk.png");
       FBox b = new FBox(gridSize,gridSize);
       b.setPosition(x*gridSize,y*gridSize);
       b.attachImage(p);
       b.setStatic(true);
       b.setName("tree_leaf");
       world.add(b);
        
     }else if (c == lava){
       FLava b = new FLava(x*gridSize,y*gridSize);
       world.add(b);
       terrain.add(b);
       b.setName("harm");
     }else if (c == bridge){
       FBridge b = new FBridge(x*gridSize,y*gridSize);
       world.add(b);
       terrain.add(b);
       b.setName("ground");
     }else if (c == goomba){
       FGoomba b = new FGoomba(x*gridSize,y*gridSize);
       world.add(b);
       enemies.add(b);
       
     }else if (c == koopa){
       FKoopa b = new FKoopa(x*gridSize,y*gridSize);
       world.add(b);
       enemies.add(b);
   
     }else if (c == hammerguy){
       FHammerBro b = new FHammerBro(x*gridSize,y*gridSize);
       world.add(b);
       enemies.add(b);

     }else if (c == boo){
       FBridge b = new FBridge(x*gridSize,y*gridSize);
       world.add(b);
       enemies.add(b);

     }else if (c == thwomp){
       FThwomp b = new FThwomp(x*gridSize,y*gridSize);
       world.add(b);
       enemies.add(b);
     }
    }
  }
}

boolean hitBody(FBody b, FBody c){
    ArrayList<FContact> contacts = b.getContacts();
    int i = 0;
    while(i < contacts.size()){
      FContact tempContact = contacts.get(i);
      if(tempContact.contains(c)) return true;
      i++;
    }
    return false;
}
