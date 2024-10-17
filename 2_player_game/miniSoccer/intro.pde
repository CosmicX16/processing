void intro(){
  background(255);
  textAlign(CENTER);
  textSize(60);
  fill(0);
  text("Mini Soccer (Chris eidtion)", textPos,200);
  strokeWeight(5);
  //with friends
  tactileRect(width/2-100,400,200,100);
  fill(50);
  rect(width/2-100,400, 200,100);


}
void introClicks(){
  if(mouseX > width/2-100 && mouseX < width/2+100 && mouseY > 400 && mouseY < 400+100){
    grandReset();
    mode = GAME;
  }
}
void grandReset(){
  leftx = 0;
 lefty = height/2;
 rightx = width;
 righty=height/2;
 
 ballx = width/2;
 bally = height/2;

 vx = 0;
 vy = 0;
 
 left2x = width/2 - width/4;
 left2y = height/2;
 right2x = width/2 + width/4;
 right2y = height/2;
 left2vx = 0;
 left2vy = 0;
 right2vx = 0;
 right2vy = 0;
 
 
 rightscore  = 0;
 leftscore = 0;
 grandTimer = 90;
 temp = 60;
 countConstant = 1;
 genDisplay  ="";
 textPos = width/2;
 buttonSize = 40;
}
void tactileRect(float x, float y,float w, float h){
  if(mouseX>x && mouseX < x+w && mouseY>y && mouseY<y+h){
    stroke(255,0,0);
  }
  else
  {
    stroke(0);
  }
}
