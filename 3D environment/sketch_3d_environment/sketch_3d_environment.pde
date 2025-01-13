import java.awt.Robot;
Robot rbt;
boolean wkey, skey,akey,dkey,shiftkey,spacekey;
float gridSize;
float xBound,zBound,yLowBound;
float eyeX,eyeY,eyeZ,focusX,focusY,focusZ,upX,upY,upZ;
float horiViewAngle, vertViewAngle;
PImage map;
void setup(){
  fullScreen(P3D);
  //size(800,800,P3D);
  textureMode(NORMAL);
  wkey = akey = dkey = skey = false;
  xBound = zBound = 2000;
  yLowBound = height;
  gridSize = 100;
  map = loadImage("map.png");
  eyeX= width/2;
  eyeY = height/2;
  eyeZ = 0;
  focusX = width/2;
  focusY = width/2;
  focusZ = 10;
  upX = 0;
  upY = 1;
  upZ = 0;
  try {
     rbt = new Robot(); 
  }
  catch(Exception e){
   e.printStackTrace();
    
  }
  horiViewAngle = radians(270);
  
}
void draw(){
  background(0);
  camera(eyeX,eyeY,eyeZ,focusX,focusY,focusZ,upX,upY,upZ);
  drawFloor(-2000,2000,height,100);
  drawFloor(-2000,2000,0,100);
  drawFocalPoint();
  controlCamera();
  drawMap();
  
  
  
}

void drawFloor(int xlow,int xhigh , int y, int increment){
  
  stroke(255);
  for(float i = xlow; i <= xhigh; i += increment){
    line(i,y,-zBound,i,y,zBound);
    line(xlow,y, i, xhigh,y,i);
  }
  
}
void drawMap(){
  
  //pushMatrix(x,y,
  for(int y = 0; y < map.height; y++){
    for(int x  =0;x< map.width; x++){
      color c = map.get(x,y);
      if(c != #FFFFFF){
        pushMatrix();
        fill(c);
        stroke(100);
        translate(x*gridSize-2000,height/2,y*gridSize-2000);
        box(gridSize,height,gridSize);
        popMatrix();
      }
    }
  }
}
void controlCamera(){
 
  if(wkey){
    eyeX += cos(horiViewAngle)*10;
    eyeZ +=  sin(horiViewAngle)*10;
  }
  if(akey){
    eyeX -= cos(horiViewAngle+ PI/2)*10 ;
    eyeZ -=  sin(horiViewAngle+ PI/2)*10;
  }
  if(dkey){
    eyeX -= cos(horiViewAngle- PI/2)*10 ;
    eyeZ -=  sin(horiViewAngle- PI/2)*10;
  }
  if(skey){
    eyeX -= cos(horiViewAngle)*10;
    eyeZ -=  sin(horiViewAngle)*10;
  }
  
  horiViewAngle += (mouseX  - pmouseX)*0.004;
  vertViewAngle += (mouseY - pmouseY)*0.004;
  if(vertViewAngle > PI/2.5) vertViewAngle = PI/2.5;
  if(vertViewAngle < -PI/2.5) vertViewAngle = -PI/2.5;
  
  if(mouseX > width-2) rbt.mouseMove(2,mouseY);
  else if(mouseX < 2) rbt.mouseMove(width-2,mouseY);
  
  focusX = eyeX +cos(horiViewAngle)*300;
  focusZ = eyeZ + sin(horiViewAngle)*300;
  focusY = eyeY + tan(vertViewAngle)*300;
  
  
}

void drawFocalPoint(){
  fill(0);
  pushMatrix();
  translate(focusX,focusY,focusZ);
  sphere(5);
  popMatrix();
}
