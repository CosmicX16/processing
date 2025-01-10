boolean wkey, skey,akey,dkey,shiftkey,spacekey;
float gridSize;
float xBound,zBound,yLowBound;
float eyeX,eyeY,eyeZ,focusX,focusY,focusZ,upX,upY,upZ;
float horiViewAngle, vertViewAngle;
void setup(){
  size(800,800,P3D);
  textureMode(NORMAL);
  wkey = akey = dkey = skey = false;
  xBound = zBound = 2000;
  yLowBound = height;
  
  eyeX= width/2;
  eyeY = height/2;
  eyeZ = 0;
  focusX = width/2;
  focusY = width/2;
  focusZ = 10;
  upX = 0;
  upY = 1;
  upZ = 0;
  
  horiViewAngle = radians(270);
  
}
void draw(){
  background(0);
  camera(eyeX,eyeY,eyeZ,focusX,focusY,focusZ,upX,upY,upZ);
  drawFloor();
  drawFocalPoint();
  controlCamera();
  
  
  
  
}

void drawFloor(){
  
  stroke(255);
  for(float i = -xBound; i <= xBound; i += 100){
    line(i,yLowBound,-zBound,i,yLowBound,zBound);
    line(-xBound,yLowBound, i, xBound,yLowBound,i);
  }
  
}
void controlCamera(){
 
  if(wkey){
    eyeZ -=  10;
  }
  if(akey){
    eyeX -= 10;
  }
  if(dkey){
    eyeX += 10;
  }
  if(skey){
    eyeZ +=10;
  }
  
  horiViewAngle += (mouseX  - pmouseX)*0.004;
  vertViewAngle += (mouseY - pmouseY)*0.004;
  if(vertViewAngle > PI/2.5) vertViewAngle = PI/2.5;
  if(vertViewAngle < -PI/2.5) vertViewAngle = -PI/2.5;
  
  
  focusX = eyeX +cos(horiViewAngle)*300;
  focusY = eyeY + tan(vertViewAngle)*300;
  focusZ = eyeZ + sin(horiViewAngle)*300;
  
}

void drawFocalPoint(){
  fill(0);
  pushMatrix();
  translate(focusX,focusY,focusZ);
  sphere(5);
  popMatrix();
}
