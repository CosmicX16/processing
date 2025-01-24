void texturedCube(float x, float y, float z, float size, PImage top, PImage bottom, PImage side){
  pushMatrix();
  float s = size/2;
  translate(x,y,z);
  
  
  beginShape(QUADS);
  texture(top);
  //     x y z tx ty
  //top
  stroke(0);
  vertex(0,0,0,0,0);
  vertex(size,0,0,size,0);
  vertex(size,0,size,size,size);
  vertex(0,0,size,0,size);
  endShape();
  beginShape(QUADS);
  texture(bottom);
  //bottom
  vertex(0,size,0,0,0);
  vertex(size,size,0,size,0);
  vertex(size,size,size,size,size);
  vertex(0,size,size,0,size);
  endShape();
  beginShape(QUADS);
  texture(side);
  //side1
 
  vertex(0,0,0,0,0);
  vertex(size,0,0,size,0);
  vertex(size,size,0,size,size);
  vertex(0,size,0,0,size);
  
  
  
  
  
  //side2
  vertex(0,0,0,0,0);
  vertex(0,0,size,size,0);
  vertex(0,size,size,size,size);
  vertex(0,size,0,0,size);  
  //side3
  vertex(size,0,0,0,0);
  vertex(size,0,size,size,0);
  vertex(size,size,size,size,size);
  vertex(size,size,0,0,size);  
  //side4
  vertex(0,0,size,0,0);
  vertex(size,0,size,size,0);
  vertex(size,size,size,size,size);
  vertex(0,size,size,0,size);  
  endShape();
  stroke(#FF1515);
  box(size*2,0,0);
  stroke(#1715FF);
  box(0,size*2,0);
  stroke(#17FF15);
  box(0,0,size*2);
  popMatrix();
}
