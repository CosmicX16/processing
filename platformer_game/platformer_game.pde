import fisica.*;
FWorld world;
FPlayer player;
ArrayList<FGameObject> terrain;


float zoom = 0.8;
color grass = #000000;
color dirt = #646764;
color tram = #FF0000;
color ice = #0000FF;
color spike = #EAFF08;
color treetrunk = #08FF2E;
boolean wkey,akey,skey,dkey,upkey,downkey,rightkey,leftkey, ekey, spacekey, flyMode,onGround;
PImage map;
int lives = 3;
int gridSize = 32;
void setup(){
  fullScreen();
  Fisica.init(this);
  world = new FWorld(-2000,-2000,2000,2000);
  terrain = new ArrayList<FGameObject>();
  world.setGravity(0,900);
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
  popMatrix();
}
void actWorld(){
  player.action();
  for(int i =0; i< terrain.size(); i++){
    FGameObject obj = terrain.get(i);
    obj.action();
    
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
        b.setName("grass");
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
        b.setFriction(4);
        b.setStatic(true);
        b.setName("ice");
        world.add(b);
        
      }else if(c== tram){
        PImage p = loadImage("trampoline.png");
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        b.attachImage(p);
        b.setStatic(true);
        b.setName("tramp");
        world.add(b);
        
      }else if(c == spike){
        PImage p = loadImage("spike.png");
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        b.attachImage(p);
        b.setStatic(true);
        b.setName("spike");
        world.add(b);
        
      }else if (c == treetrunk){
        PImage p = loadImage("tree_trunk.png");
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        b.attachImage(p);
        b.setSensor(true);
        b.setStatic(true);
        b.setName("tree_trunk");
        world.add(b);
        
     // }else if (c == treeleaf){
        //PImage p = loadImage("tree_trunk.png");
       // FBox b = new FBox(gridSize,gridSize);
       //b.setPosition(x*gridSize,y*gridSize);
        //b.attachImage(p);
        //b.setStatic(true);
       // world.add(b);
        
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
