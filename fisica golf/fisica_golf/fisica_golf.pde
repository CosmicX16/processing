import fisica.*;
boolean wkey,akey,skey,dkey,upkey,downkey,rightkey,leftkey;
FWorld world;
color blue = #AFF4FF;
void setup(){
  size(800,800);
  createWorld();
  createBodies();
  
}
void draw(){
  background(blue);
  world.draw();
  world.step();
  
}
void createWorld(){
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0,980);
  world.setEdges();
  
}
void createBodies(){
  createBall();
  createLeftPlayer();
  createRightPlayer();
  
  
}
void createBall(){
   FCircle ball = new FCircle(50);
   world.add(ball);
  
}
void createLeftPlayer(){
  FBox leftPlayer = new FBox(20,40);
  leftPlayer.setPosition(width/4-width/8,1);
  world.add(leftPlayer);
}
void createRightPlayer(){
  fill(blue);
  FBox rightPlayer = new FBox(20,40);
  rightPlayer.setPosition(width/4+width/8,1);
  world.add(rightPlayer);
}
