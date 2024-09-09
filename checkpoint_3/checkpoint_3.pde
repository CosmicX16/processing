void setup(){
  size(800,600);
}

void draw(){
  truck(150,300);
  
}
void truck(int x, int y){
  pushMatrix();
  translate(x,y);
  
  cab();
  body();
  tires();
  tires();
  tires();
  
  
  
  popMatrix();
}
void cab(){
  rect(0,0,100,150);
  rect(20,30,50,25);
  rect(-80,35,80,115);

  rect(100,0,100,150);
  triangle(100,0,150,-40,200,0);
  rect(150,-40,50,40);
  
  rect(-5,75,20,10);
  rect(-5,30,20,45);
  rect();
}
void tires(int x, int y){
  
}
void body(){
  rect(
}
