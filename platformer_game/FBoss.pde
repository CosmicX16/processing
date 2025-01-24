class FBoss extends FGameObject{
  boolean trigger;
  FBox startScan,lazer;
  PImage boss,bossCharge,lazerPic,lazerPicL,bossL,bossChargeL;
  int health;
  int direction = L;
  int vertDirection = U;
  int speed = 30;
  int attackTimer;
  int harmTimer;
  boolean chargingLazer;
  FBoss(float x, float y){
   super();
   setPosition(x,y);
   setName("harm");
   setRotatable(false);
   setHeight(gridSize*5);
   setWidth(gridSize*9.8125);
   
   boss = loadImage("bigboy.png");
   bossCharge = loadImage("bigboyfire.png");
   bossL = loadImage("bigboyL.png");
   bossChargeL = loadImage("bigboyfireL.png");
   lazerPic = loadImage("lazer.png");
   lazerPicL = loadImage("lazerL.png");
   health = 100;
   chargingLazer= false;
   
   
  }
  void action(){
    if(Math.abs(player.getX() - getX()) < 200){
    if(health > 30) attack1();
    else attack2();
    health();
    }
    move();
    animate();
  }
  void attack1(){
    if(!playerDead && Math.abs(getY() - player.getY()) < 100 ) chargingLazer = true;
    if(chargingLazer){
      attackTimer ++;
      if(attackTimer >= 300){
        attackTimer = 0;
        shootLaser();
      }
      }
    
  }
  private void shootLaser(){
      lazer = new FBox(getX(), getY());
      lazer.setWidth(8.40625*gridSize);
      lazer.setHeight(3*gridSize);
      lazer.setVelocity(speed*10*direction,getVelocityY());
      lazer.setName("harm");
      lazer.setSensor(true);
      if(direction == R) attachImage(lazerPic);
      else attachImage(lazerPicL);
      world.add(lazer);
    
  }
  void attack2(){

  }
  void move(){
    if(getX() < player.getX()) direction = R;
    else direction = L;
    if(health > 30){
      setVelocity(getVelocityX(), vertDirection*speed);
    }
    if(getY() > player.getY()) vertDirection = U;
    else vertDirection = D;
  }
  
  void animate(){
    if(direction == R){
    if(isTouching("harm")) tint(#FF3636);
    if(chargingLazer) attachImage(bossCharge);
    else attachImage(boss);
    }else{
      if(isTouching("harm")) tint(#FF3636);
      if(chargingLazer) attachImage(bossChargeL);
      else attachImage(bossL);
      
    }
    noTint();
  }
  void health(){
    harmTimer --; 
    if(isTouching("harm")){
      harmTimer = 120;
      health -= 2;
      
    }
    if(health == 0) death = true;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
