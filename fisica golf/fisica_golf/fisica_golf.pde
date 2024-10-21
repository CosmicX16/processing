import fisica.*;
boolean wkey,akey,skey,dkey,upkey,downkey,rightkey,leftkey;
FWorld world;
float vectorTheta1, vectorTheta2, vectorR1, vectorR2, vectorMag1, vectorMag2;
color blue = #AFF4FF;
color green = #038B53;
color grey = #989898;
color white = #FAFAFA;
void setup(){
  fullScreen();
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
  createCourse();
  
}
void createBall(){
   FCircle ball = new FCircle(30);
   ball.setFillColor(white);
   world.add(ball);
   
}
void createLeftPlayer(){
  FBox leftPlayer = new FBox(20,40);
  leftPlayer.setFillColor(grey);
  leftPlayer.setPosition(width/4-width/8,1);
  world.add(leftPlayer);
}
void createRightPlayer(){
  
  FBox rightPlayer = new FBox(20,40);
  rightPlayer.setFillColor(grey);
  rightPlayer.setPosition(width/4+width/8,1);
  world.add(rightPlayer);
}
void createCourse(){
  
  FPoly ObsCourse = new FPoly();
  ObsCourse.setFillColor(green);
  ObsCourse.vertex(0,height-100);
  ObsCourse.vertex(width/3,height-100);
  ObsCourse.vertex(2*width/3,height-200);
  ObsCourse.vertex(5*width/6,height-200);
  ObsCourse.vertex(5*width/6,height-160);
  ObsCourse.vertex(5*width/6+40,height-160);
  ObsCourse.vertex(5*width/6+40,height-200);
  ObsCourse.vertex(width,height-200);
  ObsCourse.vertex(width,height);
  ObsCourse.vertex(0,height);
  ObsCourse.setStatic(true);
  ObsCourse.setGrabbable(false);
  ObsCourse.setFriction(0.6);
  world.add(ObsCourse);
  
}
