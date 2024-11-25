
class FPlayer extends FBox{
  
  int frame;
  PImage[] action;
  PImage[] move;
  
   //images
  move = new PImage[3];
  move[0] = loadImage("midflap.png");
  move[1] = loadImage("downflap.png");
  move[2] = loadImage("upflap.png");
  
  FPlayer(){
    super(gridSize, gridSize); 
    frame = 0;
    setPosition(0,0);
    setName("Player");
    setRotatable(false);
    setFillColor(#FFED21);
    
  }
  
  void action(){
    
    
    
    
   
    
    
    
  }
  void animate(){
    if(frame >= action.length) frame= 0;
    if (frameCount%3 == 0){
     attachImage(action[frame]);
     frame++;
    }
    
  }
  void input(){
    float vy = getVelocityY();
    float vx = getVelocityX();
    if(akey) adjustVelocity(-20, 0);
    if(dkey) adjustVelocity(20,0);
    if(spacekey) setVelocity(vx,-200);
  }
  
  
}
