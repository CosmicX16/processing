
class FPlayer extends FGameObject{
  
  int frame;
  PImage[] action;
  PImage[] fly, runLeft, runRight, idle;
  boolean inHarm;
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
  }
  
  void action(){
  
    collision();
    input();
    animate();
    
    
    
    
  }
  void collision(){
    if(isTouching("ground")){
      onGround = true;
    }else onGround = false;
    
    if(isTouching("harm")){
      inHarm = true;
    }
    if(isTouching("harmKill")){
      //can only touch one obj at a time to detect properly
      FBody g = touchingObj("harmKill");
      if(!(Math.abs(g.getX() - getX()) <= gridSize/2 && g.getY() > getY())) inHarm = true;
      
    }
    else inHarm = false;
    
    if(inHarm){
      println("working" + millis());
      
    }
    
  }
  void animate(){
    if(frame >= action.length) frame= 0;
    if (frameCount%3 == 0){
     attachImage(action[frame]);
     frame++;
    }
    
  }
  void input(){
    double v1 = Math.sqrt(player.getVelocityX()*player.getVelocityX() + player.getVelocityY()*player.getVelocityY());
    
    
    if((akey || dkey || spacekey) && flyMode) action = fly;
    else{
      
      if(akey) action = runLeft;
      if(dkey) action = runRight;
      if(v1 < 1) action = idle;
      
      
    }
    
    float vy = getVelocityY();
    float vx = getVelocityX();
    if(akey) setVelocity(-500, vy);
    if(dkey) setVelocity(500,vy);
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
  
   boolean isTouching(String s){
    
    ArrayList<FContact> contacts = getContacts();
    for(int i =0 ; i < contacts.size(); i++){
       FContact fc = contacts.get(i);
       if(fc.contains(s)){
         return true;
       }
    }
    return false;
  }
}
  
