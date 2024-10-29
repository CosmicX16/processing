void players(){
    handlePlayerInput();
    playerStates();
    
    
    
  
}

void playerStates(){
      if(leftAiming){
        //FBox leftPlayer = new FBox(20,40);
        //leftPlayer.setFillColor(white);
        launchVector(leftBall , leftPlayer, vectorTheta1, vectorMag1, red);
        
        
      }
      if(rightAiming){
        //FBox rightPlayer = new FBox(20,40);
        //rightPlayer.setFillColor(grey);
        launchVector(rightBall, rightPlayer, vectorTheta2, vectorMag2, darkBlue);
        
      }
      
     
      
    }
    
    
void handlePlayerInput(){
  
    if(leftAiming){
      //left player p1
      if(akey)vectorTheta1 -= rad*2;
      if(dkey) vectorTheta1 += rad*2;
      if(wkey && vectorMag1 <= magCap) vectorMag1 += 3;
      if(skey && vectorMag1 > 0) vectorMag1 -= 3;
    }
    //right player p2
    if(rightAiming){
      if(leftkey)vectorTheta1 -= rad*2;
      if(rightkey) vectorTheta1 += rad*2;
      if(upkey && vectorMag2 <= magCap) vectorMag1 += 3;
      if(downkey && vectorMag2 > 0) vectorMag1 -= 3;
      
    }
}
