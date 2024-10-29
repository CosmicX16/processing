import fisica.*;
boolean wkey,akey,skey,dkey,upkey,downkey,rightkey,leftkey, leftAiming, rightAiming, pauseGameplay;
FWorld world;
float vectorTheta1, vectorTheta2, vectorR1, vectorR2, vectorMag1,vectorMag2, rad,magCap;
FCircle leftBall, rightBall;
color blue = #AFF4FF;
color darkBlue = #004AFF;
color red = #FF0004;
color green = #038B53;
color grey = #989898;
color white = #FAFAFA;
void setup(){
  fullScreen();
  createWorld();
  createBodies();
  rad = 0.0174533;
  magCap = 150;
}
void draw(){
  background(blue);
  
  world.draw();
  world.step();
  if(!pauseGameplay) players();
  stageInit();
}
void createWorld(){
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0,980);
  world.setEdges();
  
}
void stageInit(){
  leftAiming = true;
  
}
void createBodies(){
  createLeftBall(white);
  createRightBall(grey);
  createLeftPlayer();
  createRightPlayer();
  createCourse();
  
}
void createLeftBall(color c){
   leftBall = new FCircle(30);
   leftBall.setFillColor(c);
   world.add(leftBall);
   
}
void createRightBall(color c){
   rightBall = new FCircle(30);
   rightBall.setFillColor(c);
   rightBall.setPosition(40,height-100);
   world.add(rightBall);
   
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

void launchVector(FCircle c, FBox b, float r, float m, color C){
      pushMatrix();
      translate(c.getX(), c.getY());
      rotate(r);
      fill(C);
      rect(30, -7.5,m,15); 
      b.adjustRotation(r);
      b.setPosition(m+30, -7.5 +15);
      popMatrix();
      
}
      
