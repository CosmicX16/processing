 class FGoomba extends FGameObject{
  PImage[] goombaL = new PImage[2];
  PImage[] goombaR = new PImage[2];
  int direction = L;
  int speed = 50;
  int frame = 0;
  
  FGoomba(float x, float y){
   super();
   setPosition(x,y);
   setName("harmKill");
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
    die();
    
  }
  
  void collision(){
    if(isTouching("harm")) death = true;
    if(isTouching("wall") || touchingOther("harmKill")|| isTouching("Player") ){
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
    if(isTouching("Player") && Math.abs(getX() - player.getX()) <= gridSize/2 + 15 && getY() > player.getY() ) death = true;
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
    setVelocity(speed*direction, getVelocityY());
    
  }

  
  
}
