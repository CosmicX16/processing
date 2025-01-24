class FSwitchMode extends FGameObject{
  PImage modeBlockOff, modeBlockOnPrompt, modeBlockOn,modeBlockOffPrompt;
  boolean on;
  FSwitchMode(float x, float y){
   
   super();
   setPosition(x,y);
   setName("mode");
   on = false;
   setStatic(true);
   setSensor(true);
    
   
   
   attachImage(modeBlockOff);
    
  }
  void setState(boolean b){
    on = b;
  }
  void action(){
    
    animate();
    
  }
  void animate(){
    if(on && isTouching("Player")){
      attachImage(modeBlockOnPrompt);
    }else if(on){
      attachImage(modeBlockOn);
    }
    
    if(!on && isTouching("Player")){
      attachImage(modeBlockOffPrompt);
    } else if(!on){
      attachImage(modeBlockOff);
    }
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
