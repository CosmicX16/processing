float rotx, roty, rotz;
PImage diamond;
void setup(){
 
 size(800,800,P3D); 
 scale(200);
 rotx = radians(45);
 roty = radians(45);
 rotz = radians(45);
 diamond = loadImage("Diamond.png");
}
void draw(){
  background(255);
  ball(width/2,height/2,0,#FF0000,100);
  ball(width/2,height/2,200,#FF0000,100);
  ball(width/2,height/2,-200,#FF0000,100);
  ball((width/2)+200,height/2,0,#FF0000,100);
  ball((width/2)-200,height/2,0,#FF0000,100);
  ball(width/2,(height/2)+200,0,#FF0000,100);
  ball(width/2,(height/2)-200,0,#FF0000,100);
}
void cube(float x, float y, float z, color c, float size){
  pushMatrix();
  translate(x,y,z);
  rotateX(rotx);
  rotateY(roty);
  rotateZ(rotz);
  fill(c);
  box(size,size,size);
  popMatrix();
}
void ball(float x, float y, float z, color c, float size){
  pushMatrix();
  translate(x,y,z);
  rotateX(rotx);
  rotateY(roty);
  rotateZ(rotz);
  fill(c);
  sphere(size);
  popMatrix();
}
void texturedCube(float x, float y, float z, color c, float size, PImage t){
  pushMatrix();
  float s = size/2;
  translate(x,y,z);
  rotateX(rotx);
  rotateY(roty);
  rotateZ(rotz);
  
  
  beginShape(QUADS);
  texture(t);
  //     x y z tx ty
  //top
  vertex(0,0,0,0,0);
  vertex(1,0,0,1,0);
  vertex(1,0,1,1,1);
  vertex(0,0,1,0,1);
  
  //bottom
  
  //side1
  
  //side2
  
  //side3
  
  //side4
  
  
  popMatrix();
}
void mouseDragged(){
  rotx += (pmouseY-mouseY)*0.01;
  roty += (pmouseX - mouseX)*-0.01;
}
