class FHammerBro extends FGameObject{
  PImage[] hammerbroL = new PImage[2];
  PImage[] hammerbroR = new PImage[2];
  int direction = L;
  int speed = 50;
  int frame = 0;
  FBox hammer;
  FHammerBro(float x, float y){
   super();
   setPosition(x,y);
   setHeight(gridSize*2);
   setName("harmKill");
   setRotatable(false);
   
   hammerbroL[0] = loadImage("hammerbro0.png");
   hammerbroL[1] = loadImage("hammerbro1.png");
   hammerbroR[0] = loadImage("hammerbro2.png");
   hammerbroR[1] = loadImage("hammerbro3.png");
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
    if(isTouching("Player") && Math.abs(getX() - player.getX()) < gridSize && getY() > player.getY() ) death = true;
  }
  void animate(){
    if(frame >= hammerbroR.length) frame= 0;
    if (frameCount%5 == 0){
     if(direction == L) attachImage(hammerbroL[frame]);
     if(direction == R) attachImage(hammerbroR[frame]);
     frame++;
    }
    
  }
  void move(){
    setVelocity(speed*direction, getVelocityY());
    
  }
  
  
  
  
}
