void players(){
    handlePlayerInput();
    playerStates();
    
  
}

void playerStates(){
      if(leftAiming){
        FBox leftPlayer = new FBox(20,40);
        leftPlayer.setFillColor(white);
        launchVector(leftBall , leftPlayer, vectorTheta1, vectorMag1, red);
        
      }
      if(rightAiming){
        FBox rightPlayer = new FBox(20,40);
        rightPlayer.setFillColor(grey);
        launchVector(rightBall, rightPlayer, vectorTheta2, vectorMag2, darkBlue);
        
      }
      v1 = Math.sqrt(leftBall.getVelocityX()*leftBall.getVelocityX() + leftBall.getVelocityY()*leftBall.getVelocityY());
      v2 = Math.sqrt(rightBall.getVelocityX()*rightBall.getVelocityX() + rightBall.getVelocityY()*rightBall.getVelocityY());
      if(!leftAiming && (hitBody(leftBall, Hole1)|| hitBody(leftBall, Hole2))  ) leftAiming = true;
      if(!rightAiming && (hitBody(rightBall, Hole1) || hitBody(rightBall, Hole2))) rightAiming = true; 
      
      
      
}
    
    
void handlePlayerInput(){
  
    if(leftAiming){
      //left player p1
      if(akey)vectorTheta1 -= rad*3;
      if(dkey) vectorTheta1 += rad*3;
      if(wkey && vectorMag1 <= magCap) vectorMag1 += 3;
      if(skey && vectorMag1 > 0) vectorMag1 -= 3;
    }
    //right player p2
    if(rightAiming){
      if(leftkey)vectorTheta2 -= rad*2;
      if(rightkey) vectorTheta2 += rad*2;
      if(upkey && vectorMag2 <= magCap) vectorMag2 += 3;
      if(downkey && vectorMag2 > 0) vectorMag2 -= 3;
      
    }
    if(ekey && leftAiming){
      applyLeftSwing();
      ekey = false;
      leftAiming = false;
    }
    if(slashkey && rightAiming){
      applyRightSwing();
      slashkey = false;
      rightAiming = false;
    }
    
}
float coolLeft = 0;
float coolRight = 0;

void applyRightSwing(){

  //while(pauseGameplay){
    
  //}
  float x = vectorMag2* (float) Math.cos(vectorTheta2);
  float y =  vectorMag2* (float)Math.sin(vectorTheta2);
  rightBall.adjustVelocity(-x*5,-y*5);
  
  if(mode == 0) rightHoles1 ++;
  if(mode == 1) rightHoles2 ++;
}
void applyLeftSwing(){
  
  
  float x = vectorMag1* (float) Math.cos(vectorTheta1);
  float y =  vectorMag1* (float)Math.sin(vectorTheta1);
  leftBall.adjustVelocity(-x*5,-y*5);
  
  if(mode == 0) leftHoles1 ++;
  if(mode == 1) leftHoles2++;
  
}
