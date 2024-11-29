import fisica.*;
boolean wkey,akey,skey,dkey,upkey,downkey,rightkey,leftkey, ekey, slashkey, leftAiming, rightAiming, pauseGameplay, pauseLeft, pauseRight;
FWorld world;
float vectorTheta1, vectorTheta2, vectorMag1,vectorMag2, rad,magCap, zoom;
double v1, v2;
String gameTitle;
int leftHoles1,leftHoles2,rightHoles1,rightHoles2, mode; 
int leftScore, rightScore;
FCircle leftBall, rightBall;
FPoly Hole1, Hole2;
FBox leftPlayer, rightPlayer, goal;
color blue = #AFF4FF;
color darkBlue = #004AFF;
color red = #FF0004;
color green = #038B53;
color grey = #989898;
color white = #FAFAFA;
color manila = #F9FAE1;
void setup(){
  fullScreen();
  createWorld();
  createBodies();
  rad = 0.0174533;
  magCap = 150;
  zoom = 1;
  stageInit();
}
void draw(){
  pushMatrix();

  //(Math.abs(leftBall.getY() - rightBall.getY()))
  //translate(-Math.abs(leftBall.getX()-rightBall.getX())*zoom + width/2, -leftBall.getY()*zoom + height/2);
  scale(1);
  background(blue);
  scoreDisplay();
  stageManage();
  world.draw();
  world.step();
  if(!pauseGameplay) players();
  popMatrix();
}
void createWorld(){
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0,980);
  world.setEdges();
  
}
void stageInit(){
  leftAiming = true;
  rightAiming = true;
  leftHoles1=  0;
  leftHoles2 = 0;
  rightHoles1 = 0;
  rightHoles2 = 0;
  vectorMag1 = 75;
  vectorMag2 = 75;
  leftScore = 0;
  rightScore = 0;
}
void createBodies(){
  createLeftBall(white);
  createRightBall(grey);
  //createLeftPlayer();
  //createRightPlayer();
  
  createCourse1();
  createGoal(5*width/6+20,height-250);
}
void createGoal(int x, int y){
   goal = new FBox(38,10);
   goal.setPosition(x,y);
   goal.setGrabbable(false);
   world.add(goal);
}
void createLeftBall(color c){
   leftBall = new FCircle(15);
   leftBall.setFillColor(c);
   leftBall.setPosition(width/4-width/8, height-100);
   world.add(leftBall);
   
}
void createRightBall(color c){
   rightBall = new FCircle(15);
   rightBall.setFillColor(c);
   rightBall.setPosition(width/4+width/128, height-100);
   world.add(rightBall);

}
void createLeftPlayer(){
  leftPlayer = new FBox(20,40);
  leftPlayer.setFillColor(grey);
  leftPlayer.setPosition(width/4-width/8,1);
  world.add(leftPlayer);
}
void createRightPlayer(){
  
  rightPlayer = new FBox(20,40);
  rightPlayer.setFillColor(grey);
  rightPlayer.setPosition(width/4+width/8,1);
  world.add(rightPlayer);
}
void createCourse1(){
  
  Hole1 = new FPoly();
  Hole1.setFillColor(green);
  Hole1.vertex(0,height-100);
  Hole1.vertex(width/3,height-100);
  Hole1.vertex(2*width/3,height-200);
  Hole1.vertex(5*width/6,height-200);
  Hole1.vertex(5*width/6,height-160);
  Hole1.vertex(5*width/6+40,height-160);
  Hole1.vertex(5*width/6+40,height-200);
  Hole1.vertex(width,height-200);
  Hole1.vertex(width,height);
  Hole1.vertex(0,height);
  Hole1.setStatic(true);
  Hole1.setGrabbable(false);
  Hole1.setFriction(0.4);
  world.add(Hole1);
}
void createCourse2(){
  
  Hole2 = new FPoly();
  Hole2.setFillColor(green);
  Hole2.vertex(0,height-100);
  Hole2.vertex(width/4,height-100);
  Hole2.vertex(width/2-100,height-200);
 
  Hole2.vertex(width/2-20,height-250);
  Hole2.vertex(width/2 +20,height-250);
  Hole2.vertex(width/2 + 40, height-225);
  Hole2.vertex(width/2 + 220, height-225);
  Hole2.vertex(width/2 + 250, height-250);
  Hole2.vertex(3*width/4+50,height-300);
  Hole2.vertex(3*width/4 + 60, height-310);
  Hole2.vertex(3*width/4 + 60, height-270);
  Hole2.vertex(3*width/4 + 100, height-270);
  Hole2.vertex(3*width/4 + 100, height-310);
  
  Hole2.vertex(width, height-275);
  Hole2.vertex(width,height);
  Hole2.vertex(0,height);
  Hole2.setStatic(true);
  Hole2.setGrabbable(false);
  Hole2.setFriction(0.4);
  world.add(Hole2);
}
void stageManage(){
  if(hitBody(leftBall, goal)){
    if(!hitBody(rightBall,goal)) leftScore++;
    pauseLeft = true;
  }
  if(hitBody(rightBall, goal)){
    if(!hitBody(leftBall,goal)) rightScore++;
    pauseRight = true;
  }
  if(hitBody(leftBall, goal) && mode == 0 && hitBody(rightBall,goal)){
        
        world.remove(Hole1);
        createCourse2();
        mode++;
        resetStage();
  }
  if(hitBody(rightBall, goal) && mode == 0 && hitBody(leftBall,goal)){
        
        world.remove(Hole1);
        createCourse2();
        mode++;
        resetStage();
  }
  if(hitBody(rightBall, goal) && mode == 1 && hitBody(leftBall,goal)){
        mode++;
        pauseGameplay = true;
        endDisplay();
        println("working");
  }
  if(hitBody(leftBall, goal) && mode == 1 && hitBody(rightBall,goal)){
        mode++;
        pauseGameplay = true;
        endDisplay();
  }
  if(mode == 2) endDisplay();
}
void resetStage(){
   if(mode == 1){
     rightBall.setPosition(width/4-width/8 -50,height-100);
     leftBall.setPosition(width/4+width/128 -50, height-100);
   } else if(mode == 2){
     
   }
   leftBall.setVelocity(0,0);
   rightBall.setVelocity(0,0);
   leftBall.setAngularVelocity(0);
   rightBall.setAngularVelocity(0);
   pauseLeft= false;
   pauseRight = false;
   vectorTheta1 = 0;
   vectorTheta2 = 0;
   vectorMag1 = 75;
   vectorMag2 = 75;
   goal.setPosition(3*width/4 + 80, height-270);
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
void scoreDisplay(){
  gameTitle = ("Ultra pro golfing \n codex crack");
  fill(manila);
  strokeWeight(3);
  pushMatrix();
  translate(30,30);
  rect(0,0,width/8,height/3);
  fill(0);
  textAlign(CENTER);
  textSize(18);
  strokeWeight(6);
  text(gameTitle, width/16, 25);
  text("Hole 1", 30, 80);
  text("Hole 2", 30, 160);
  textSize(28);
  //left
   if(mode == 0){
     if(!pauseLeft) fill(red);
     else fill(#FFEB0A);
   }
   else fill(0);
   text(leftHoles1, 120,80);
   if(mode == 1){
     if(!pauseLeft) fill(red);
     else fill(#FFEB0A);
   }
   else fill(0);
   if(mode == 1) text(leftHoles2,120,162);
  //right
  textSize(28);
    if(mode == 0){
     if(!pauseRight) fill(darkBlue);
     else fill(#FFEB0A);
   }
    else fill(0);
    text(rightHoles1,160,80);
    if(mode == 1){
     if(!pauseRight) fill(darkBlue);
     else fill(#FFEB0A);
   }
    else fill(0);
    if(mode == 1) text(rightHoles2,160,162);
  popMatrix();
  strokeWeight(1);
}
void endDisplay(){
  textAlign(CENTER);
  
  if(leftScore > rightScore){
    fill(red);
    text("Left wins: first to find more holes", width/2,height/2);
  }else if( rightScore > leftScore){
    fill(darkBlue);
    text("Right wins: first to find more holes", width/2,height/2);
    
  }
  else{
    if((rightHoles1+rightHoles2) > (leftHoles1+leftHoles2)){
      fill(darkBlue);
      text("Left wins: least holes", width/2,height/2);
    }else{
      fill(red);
      text("Right wins: least holes", width/2,height/2);
    }
    
  }
  
  
  
}
