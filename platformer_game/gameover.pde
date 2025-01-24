void gameover(){
  
  
  stroke(255);
  tactileRect(width/2-200,height/2 - 125, 400,75);
  fill(50);
  rect(width/2-200,height/2 - 125, 400,75);
  
  
  
  
  
  
}
void gameoverClicks(){
  
  if(mouseX > width/2-200 && mouseX < width/2+200 && mouseY > height/2 - 125 && mouseY < height/2- 125+ 75){
    mode = INTRO;
  }
}
