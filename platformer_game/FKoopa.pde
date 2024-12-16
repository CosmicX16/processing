class FKoopa extends FGameObject{
  PImage[] koopaL = new PImage[2];
  PImage[] koopaR = new PImage[3];
  int direction = L;
  int speed = 50;
  int frame = 0;
  boolean death;
  FKoopa(float x, float y){
   super();
   setPosition(x,y);
   setHeight(gridSize*2);
   setName("harmKill");
   setRotatable(false);
   koopaL[0] = loadImage("goomba0.png");

  }
  
  void action(){
    animate();
    collision();
    move();
    die();
    
  }
  
  void collision(){
    if(isTouching("wall") || touchingOther("harmKill") ){
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
    if(isTouching("Player") && Math.abs(getX() - player.getX()) < gridSize && getY() > player.getY() ){
      death = true;
      
    }
  }
  void animate(){
    if(frame >= koopaL.length) frame= 0;
    if (frameCount%5 == 0){
     if(direction == L) attachImage(koopaL[frame]);
     if(direction == R) attachImage(koopaR[frame]);
     frame++;
    }
    
  }
  void move(){
    setVelocity(speed*direction, getVelocityY());
    
  }
  
  
  
  
}
