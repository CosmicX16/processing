void gameover(){  
 
  if (leftscore > rightscore){
    fill(#B70000);
  text("Player 1 wins",width/2,height/2);
  }else if(rightscore>leftscore) {
    fill(#090181);
    text("Player 2 wins", width/2,height/2);
 
 }else{
   fill(#A7009F);
   text("Score is tied", width/2,height/2);
 }
 
}

void gameoverClicks(){
  gameReset();
  mode = INTRO;
  
  
}
void gameReset(){
  
  
}
