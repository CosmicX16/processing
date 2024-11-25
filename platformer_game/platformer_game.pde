import fisica.*;
FWorld world;
FPlayer player;

float zoom = 0.8;
color black = #000000;
color red = #FF0000;
color blue = #0000FF;

boolean wkey,akey,skey,dkey,upkey,downkey,rightkey,leftkey, ekey, spacekey;





PImage map;
int gridSize = 32;
void setup(){
  size(600,600);
  Fisica.init(this);
  world = new FWorld(-2000,-2000,2000,2000);
  world.setGravity(0,900);
  loadMap();
  loadPlayer();
}

void draw(){
  background(#CFFBFC);
  drawWorld();
  player.action();

}
void drawWorld(){
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2); 
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
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
      if(c == black){
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        b.setStatic(true);
        world.add(b);
      }
    }
  }
}
