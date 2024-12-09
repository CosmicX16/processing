class FThwomp extends FGameObject{
  PImage[] thwomp = new PImage[2];
  boolean angry = false;
  int speed;
  int frame;
  float initX;
  float initY;
  FThwomp(float x, float y){
   super();
   setPosition(x,y);
   initX =  x;
   initY = y;
   setWidth(gridSize*2);
   setHeight(gridSize*2);
   speed = 50;
   frame =0;
   setName("thwomp");
   setRotatable(false);
   setStatic(true);
   thwomp[0] = loadImage("thwomp0.png");
   thwomp[1] = loadImage("thwomp1.png");
   
  }
  
  void action(){
    
    collision();
    animate();
    move();
    
    
  }
  
  void collision(){
    if(Math.abs((getX() - player.getX())) < 42){
      angry = true;
    }else angry = false;
  }
  void animate(){
    if(!angry) attachImage(thwomp[0]);
    else attachImage(thwomp[1]);
    
  }
  void move(){
    if(angry) {
      setStatic(false);
      setVelocity(0, 600);
    }else if(getY() != initY) setVelocity(0,-100);

    if(getY() == initY && !angry){
      setVelocity(0,0);
      setStatic(true);
    }
  }
  
  
  
  
}
