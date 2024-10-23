class players{
  
    void playerStates(){
      if(leftAiming){
        launchVector(leftBall, vectorTheta1, vectorMag1);
        
      }
      if(rightAiming){
        launchVector(rightBall, vectorTheta2, vectorMag2);
        
      }
      
      
      
    }
    
    
    void handlePlayerInput(){
    if(leftAiming){
      //left player p1
      if(wkey)  
    }
    //right player p2
    if(rightAiming){
      
      
    }
    }
    void launchVector(FCircle c, float r, float m){
      pushMatrix();
      translate(c.getX(), c.getY());
      rotate(r);
      rect(m+15,5,80,20); 
      
      
      popMatrix();
      
      
    }
    
    
}
  
  
  
  
  
  
  
  
}
