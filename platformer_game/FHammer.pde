/* class FGoomba extends FGameObject{
  PImage[] goombaL = new PImage[2];
  PImage[] goombaR = new PImage[2];
  int direction = L;
  int speed = 50;
  int frame = 0;
  FGoomba(float x, float y){
   super();
   setPosition(x,y);
   setName("goomba");
   setRotatable(false);
   goombaL[0] = loadImage("goomba0.png");
   goombaL[1] = loadImage("goomba1.png");
   goombaR[0] = loadImage("goomba1.png");
   goombaR[1] = loadImage("goomba0.png");
  }
  
  void action(){
    animate();
    collision();
    move();
    
    
  }
  
  void collision(){
    if(isTouching("wall")){
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
  }
  void animate(){
    if(frame >= goombaR.length) frame= 0;
    if (frameCount%5 == 0){
     if(direction == L) attachImage(goombaL[frame]);
     if(direction == R) attachImage(goombaR[frame]);
     frame++;
    }
    
  }
  void move(){
    setVelocity(10*direction, getVelocityY());
    
  }
  
  
  
  
}
*/
