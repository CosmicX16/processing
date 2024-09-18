boolean p1 = true;
boolean p2 = false; 
boolean p3 = false;
color white = #FFFFFF;
int b1 = 20;
int b2 = 400;
int bw1 = 75;
int bh1 = 75;
int b3 = 705;
int b4= 400;
int bw2 = 75;
int bh2 = 75;

void setup(){
  size(800,800);
  
  
}
void draw(){
background(51);
  //buttons
  tactileRect(b1,b2,bw1,bh1);
  rect(b1,b2,bw1,bh1);
  tactileRect(b3,b4,bw2,bh2);
  rect(b3,b4,bw2,bh2);
  if(p1){
    p1();
  }
  if(p2){
    p2();
  }
  if(p3){
    p3();
  }
  
}
void mouseReleased(){
  if(touchingRect(b1,b2,bw1,bh1)){
    if(p1){
      p1 = false;
      p3 = true;
    }else if(p2){
      p2 = false;
      p1 = true;
    } else if(p3){
      p3 = false;
      p2 = true;
    }
  }
  if(touchingRect(b3,b4,bw2,bh2)){
     if(p1){
      p1 = false;
      p2 = true;
      println("true");
    }else if(p2){
      p2 = false;
      p3 = true;
    } else if(p3){
      p3 = false;
      p1 = true;
    }
  }
}
boolean touchingRect(int x, int y, int w, int h){
  if(mouseX> x && mouseX < x+w && mouseY > y && mouseY <y+h){
    return true;
  } else return false;
}
void tactileRect(float x, float y,float w, float h){
  if(mouseX>x && mouseX < x+w && mouseY>y && mouseY<y+h){
    stroke(white);
  }
  else
  {
    stroke(0);
  }
}
