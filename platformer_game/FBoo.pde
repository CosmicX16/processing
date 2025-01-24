class FBoo extends FGameObject{
  PImage[] booL = new PImage[2];
  PImage[] booR = new PImage[2];
  int direction = L;
  int vertDirection = U;
  int speed = 20;
  int frame = 0;
  FBoo(float x, float y){
   super();
   setPosition(x,y);
   setName("harmKill");
   setRotatable(false);
   booL[0] = loadImage("booL.png");
   booL[1] = loadImage("booL.png");
   booR[0] = loadImage("booR.png");
   booR[1] = loadImage("booR.png");
  }
  
  void action(){
    animate();
    collision();
    move();
    die();
    
  }
  
  void collision(){
    if(getX() < player.getX()) direction = R;
    else direction = L;
    if(isTouching("wall") || touchingOther("harmKill") ){
      direction *= -1;
      setPosition(getX()+direction, getY()+ vertDirection);
    }
    if(getY() > player.getY()) vertDirection = U;
    else vertDirection = D;
    
    if(isTouching("Player") && Math.abs(getX() - player.getX()) <= gridSize/2 + 15 && getY() > player.getY() ) death = true;
    }
  void animate(){
    if(frame >= booR.length) frame= 0;
    if (frameCount%5 == 0){
     if(direction == L) attachImage(booL[frame]);
     if(direction == R) attachImage(booR[frame]);
     frame++;
    }
    
  }
  void move(){
    if(player.facing() == R && player.getX() < getX() || player.facing() == L && player.getX() > getX()) setVelocity(0,0);
    
    else setVelocity(speed*direction*2, vertDirection*speed*2);
    
  }

}
