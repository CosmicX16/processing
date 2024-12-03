class FBridge extends FGameObject {
  PImage bridge = loadImage("bridge_center.png");
  FBridge(float x, float y){
   super();
   setPosition(x,y);
   setName("bridge");
   attachImage(bridge);
   setStatic(true);
    
    
  }
  void action(){
    if(isTouching("Player")){
     setStatic(false);
     setSensor(true);
    }
    
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
