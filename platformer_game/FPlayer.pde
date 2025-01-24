
class FPlayer extends FGameObject{
  
  int frame;
  PImage[] action;
  PImage[] fly, runLeft, runRight, idle;
  PImage life;
  PImage feather; 
  int lives;
  boolean inHarm;
  int harmTimer;
  int direction = L;
   //images
  FCircle hitbox;
  
  FPlayer(){
    super(); 
    setPosition(0,0);
    setName("Player");
    setRotatable(false);
    setFillColor(#FFED21);
    setFriction(0.3);
    frame = 0;
    life = loadImage("life.png");
    feather = loadImage("feather.png");
    fly = new PImage[3];
    fly[0] = loadImage("midflap.png");
    fly[1] = loadImage("downflap.png");
    fly[2] = loadImage("upflap.png");
    runLeft = new PImage[3];
    runLeft[0] = loadImage("runleft1.png");
    runLeft[1] = loadImage("runleft2.png");
    runLeft[2] = loadImage("runleft3.png");
    runRight = new PImage[3];
    runRight[0] = loadImage("runright1.png");
    runRight[1] = loadImage("runright2.png");
    runRight[2] = loadImage("runright3.png");
    idle = new PImage[1];
    idle[0] = loadImage("idle0.png");
    action = idle;
    lives = maxLives;
    harmTimer = 0;
  }
  
  void action(){
  
    collision();
    input();
    animate();
    lives();
    playerdie();
    fireEggs();
    
  }
  void collision(){
    if(getY() > lowBound) lives = 0;
    
    if(isTouching("ground") || isTouching("wall")){
      onGround = true;
    }else onGround = false;
    
    if(isTouching("harm") && harmTimer < 0){
      inHarm = true;
    }
    if(isTouching("harmKill")){
      //can only touch one obj at a time to detect properly
      FBody g = touchingObj("harmKill");
      if(!(Math.abs(g.getX() - getX()) <= gridSize/2 + 15 && g.getY() > getY()) && harmTimer < 0) inHarm = true;
      if(Math.abs(g.getX() - getX()) <= gridSize/2 + 15 && g.getY() > getY()) setVelocity(getVelocityX(), -500);
    }
    
    
    if(inHarm){
      //setVelocity(getPositionX() - p
      lives--;
      inHarm = false;
      harmTimer = 120;
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
    
    
    if(isTouching("mode")){
      if(flyMode) flyMode = false;
      else flyMode = true;
    }
  }
  void animate(){
    
    harmTimer --;
    if(frame >= action.length) frame= 0;
    if (frameCount%3 == 0){
     if(harmTimer >= 0) tint(#FF3636);
     else noTint();
     attachImage(action[frame]);
     frame++;
    }
    
  }
  void lives(){
    pushMatrix();
    translate( player.getX()-width/2, player.getY() -height/2);
    for(int i = 0; i < lives; i++){
      image(life, i*60 - 60 ,0, 50, 50);
    }
    popMatrix();
    
    if(lives == 0) death = true;
  }
  void input(){
    double v1 = Math.sqrt(player.getVelocityX()*player.getVelocityX() + player.getVelocityY()*player.getVelocityY());
    
    if(!death){
    if((akey || dkey || spacekey) && flyMode) action = fly;
    else{
      
      if(akey) action = runLeft;
      if(dkey) action = runRight;
      if(v1 < 1){
        
        action = idle;
      
      }
    }
    
    float vy = getVelocityY();
    float vx = getVelocityX();
    if(akey){
      setVelocity(-500, vy);
      direction = L;
    }
    if(dkey) {
      setVelocity(500,vy);
      direction = R;
    }
    if(flyMode){
      if(spacekey){
        setVelocity(vx,-500);
        spacekey = false;
      }
    }else{
      if(spacekey && onGround){
        setVelocity(vx,-500);
      }
    }
    }
  }
  void fireEggs(){
    if(flyMode && ekey){
      FBox hammer = new FBox(gridSize,gridSize);
      hammer.setPosition(getX(),getY());
      hammer.setAngularVelocity(150);
      hammer.setVelocity(450*direction, -200);
      hammer.setSensor(true);
      hammer.setName("harm");
      hammer.attachImage(life);
      world.add(hammer);
      projectiles.add(hammer);
      
    }
    
  }
  boolean invuln(){
    return (harmTimer >= 0);
  }
  int facing(){
    return direction;
  }
  
  void playerdie(){
    
    if (death) {
      playerDead = true;
      for(int i =0; i < 10; i++){
        FBox b = new FBox(gridSize,gridSize*0.5);
        b.setPosition(cameraObj.getX(),cameraObj.getY());
        b.attachImage(feather);
        b.setAngularVelocity((float) Math.random()*600 - 500);
        b.setVelocity((float) Math.random()*200 -100 ,(float)Math.random()*200 -400 );
        b.setSensor(true);
        projectiles.add(b);
        world.add(b);
      }
      death = false;
      world.remove(this);
    }
    
  }
   
}
  
