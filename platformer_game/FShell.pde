class FShell extends FGameObject{
  PImage[] shell = new PImage[2];
  
  int direction = L;
  int speed = 150;
  int frame = 0;
  boolean death;
  FShell(float x, float y){
   super();
   setPosition(x,y);
   setName("harmKill");
   setRotatable(false);
   shell[0] = loadImage("goomba0.png");
   shell[1] = loadImage("goomba1.png");

  }
  
  void action(){
    animate();
    collision();
    move();
    die();
    
  }
  
  void collision(){
    if(isTouching("wall") || touchingOther("harmKill") || touchingOther("harm")){
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
    if(isTouching("Player") && Math.abs(getX() - player.getX()) < gridSize && getY() > player.getY() ) death = true;
  }
  void animate(){
    if(frame >= shell.length) frame= 0;
    if (frameCount%5 == 0){
     attachImage(shell[frame]);
     frame++;
    }
    
  }
  void move(){
    setVelocity(speed*direction, getVelocityY());
    
  }
  
}
