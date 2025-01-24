class FSwitchSave extends FGameObject{
  PImage saveblockOff, saveblockOn;
  boolean activated;
  
  FSwitchSave(float x, float y){
   super();
   setPosition(x,y);
   setName("save");
   activated = false;
   setStatic(true);
   
   
   saveblockOff = loadImage("nest.png");
   saveblockOn = loadImage("nestfull.png");
   attachImage(saveblockOff);
  }
  void action(){
    if(isTouching("Player")) activated = true;
    
    
    if(activated) attachImage(saveblockOn);
    else attachImage(saveblockOff); 
  }
  boolean isOn(){
    return activated;
  }
  void setCurrentSave(boolean b){
    activated = b;
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
