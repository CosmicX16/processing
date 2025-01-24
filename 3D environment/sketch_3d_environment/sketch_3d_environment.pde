import java.awt.Robot;
Robot rbt;
boolean wkey, skey,akey,dkey,shiftkey,spacekey;
boolean skipFrame;
float gridSize;
float xBound,zBound,yLowBound;
float eyeX,eyeY,eyeZ,focusX,focusY,focusZ,upX,upY,upZ;
float horiViewAngle, vertViewAngle;
PImage map;
PImage mossyStone,diamond,grass,dirt,grassSide,stoneBrick,log;
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
  eyeY = 9*height/10;
  eyeZ = height/2;
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
  skipFrame = false;
  horiViewAngle = radians(270);
  
  diamond = loadImage("Diamond.png");
  grassSide = loadImage("Grass_Block_Side.png");
  grass = loadImage("Grass_Block_Top_C.png");
  dirt = loadImage("Dirt.png");
  stoneBrick = loadImage("Stone_Bricks.png");
  
  diamond.resize(100,100);
  grassSide.resize(100,100);
  grass.resize(100,100);
  dirt.resize(100,100);
  stoneBrick.resize(100,100);
  
  
  
  
  textureMode(NORMAL);
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
        texturedCube(x*gridSize -2000,height- gridSize,y*gridSize -2000, gridSize,grass,dirt,grassSide);
        texturedCube(x*gridSize -2000,height- gridSize*2,y*gridSize -2000, gridSize,stoneBrick,stoneBrick,stoneBrick);
        texturedCube(x*gridSize -2000,height- gridSize*3,y*gridSize -2000, gridSize,stoneBrick,stoneBrick,stoneBrick);
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
  if(!skipFrame){
    horiViewAngle += (mouseX  - pmouseX)*0.004;
    vertViewAngle += (mouseY - pmouseY)*0.004;
  }
  if(vertViewAngle > PI/2.5) vertViewAngle = PI/2.5;
  if(vertViewAngle < -PI/2.5) vertViewAngle = -PI/2.5;
  
  if(mouseX > width-2){
    skipFrame = true;
    rbt.mouseMove(2,mouseY);
  }
  else if(mouseX < 2){
    rbt.mouseMove(width-2,mouseY);
    skipFrame = true;
  }else skipFrame = false;
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
