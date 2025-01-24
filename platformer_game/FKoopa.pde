class FKoopa extends FGameObject{
  PImage[] koopaL = new PImage[2];
  PImage[] koopaR = new PImage[3];
  int direction = L;
  int speed = 50;
  int frame = 0;
  
  FKoopa(float x, float y){
   super();
   setPosition(x,y);
   setHeight(gridSize*2);
   setName("harmKill");
   setRotatable(false);
   koopaL[0] = loadImage("koopaL1.png");
   koopaL[1] = loadImage("koopaL2.png");
   koopaR[0] = loadImage("koopaR1.png");
   koopaR[1] = loadImage("koopaR2.png");
  }
  
  void action(){
    animate();
    collision();
    move();
    dieDrop();
  }
  
  void collision(){
    if(isTouching("harm")) death = true;
    if(isTouching("wall") || touchingOther("harmKill")|| isTouching("Player") ){
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
    if(isTouching("Player") && Math.abs(getX() - player.getX()) <= gridSize/2 + 15 && getY()+gridSize*2 > player.getY() ) {
      death = true;
      //println("working" + millis());
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
