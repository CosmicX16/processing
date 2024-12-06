class FThwomp extends FGameObject{
  PImage[] thwomp = new PImage[2];

  int direction = L;
  int speed = 50;
  int frame = 0;
  FThwomp(float x, float y){
   super();
   setPosition(x,y);
   setName("goomba");
   setRotatable(false);
   thwomp[0] = loadImage("goomba0.png");
   thwomp[1] = loadImage("goomba1.png");

  }
  
  void action(){
    animate();
    move();
    
    
  }
  
  void collision(){
    
  }
  void animate(){
    if(frame >= thwomp.length) frame= 0;
    if (frameCount%5 == 0){
     attachImage(thwomp[frame]);
     frame++;
    }
    
  }
  void move(){
    
    
  }
  
  
  
  
}
