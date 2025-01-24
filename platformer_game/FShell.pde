class FShell extends FGameObject{
  PImage[] shell = new PImage[2];
  
  int direction = L;
  int speed = 180;
  int frame = 0;
  FShell(float x, float y){
   super();
   setPosition(x,y);
   setName("harmKill");
   setRotatable(false);
   setFriction(-4);
   shell[0] = loadImage("shellR.png");
   shell[1] = loadImage("shellL.png");
   
  }
  
  void action(){
    animate();
    collision();
    move();
    die();
    
  }
  
  void collision(){
    if(isTouching("wall") || touchingOther("harmKill") || isTouching("Player")){
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
    if(isTouching("harm")) death = true;
    if(isTouching("Player") && Math.abs(getX() - player.getX()) <= gridSize/2 + 15 && getY()+gridSize > player.getY()  ) death = true;
  }
  void animate(){
    if(direction == L) attachImage(shell[1]);
    else attachImage(shell[0]);
    
  }
  void move(){
    if(isTouching("Player")){
     if(player.getVelocityX() > 0 ) setVelocity(speed, 0);
     else setVelocity(-speed,0);
   }else adjustVelocity(0,0);
    setVelocity(speed*direction, getVelocityY());
    
  }
  
}
