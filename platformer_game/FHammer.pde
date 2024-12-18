class FHammerBro extends FGameObject{
  PImage[] hammerbroL;
  PImage[] hammerbroR;
  PImage hammerpic;
  int direction = L;
  int speed = 50;
  int frame = 0;
  int hammerTimer = 0;
  FHammerBro(float x, float y){
   super();
   setPosition(x,y);
   setHeight(51);
   setName("harmKill");
   setRotatable(false);
   hammerpic = loadImage("hammer.png");
   hammerbroL = new PImage[2];
   hammerbroR = new PImage[2];
   hammerbroL[0] = loadImage("hammerbroC.png");
   hammerbroL[1] = loadImage("hammerbroD.png");
   hammerbroR[0] = loadImage("hammerbroA.png");
   hammerbroR[1] = loadImage("hammerbroB.png");
  }
  
  void action(){
    animate();
    collision();
    move();
    hammers();
    die();
    
  }
  
  void collision(){
    
    if(player.getX() < getX()) direction = L;
    else direction = R;
    if(isTouching("Player") && Math.abs(getX() - player.getX()) <= gridSize/2 && getY() > player.getY() ) death = true;
  }
  void hammers(){
    
    if(!death && frameCount%30 == 0){
      FBox hammer = new FBox(gridSize,gridSize);
      hammer.setPosition(getX(),getY());
      hammer.setAngularVelocity(600);
      hammer.setVelocity(750*direction, -800);
      hammer.setSensor(true);
      hammer.setName("harm");
      hammer.attachImage(hammerpic);
      world.add(hammer);
      projectiles.add(hammer);
    }
    
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
