import java.util.*;
class FLava extends FGameObject {
  PImage[] lava = new PImage[6];
  int frame;
  FLava(float x, float y){
   super();
   setPosition(x,y);
   setName("lava");
   
   setStatic(true);
   frame = (int)( Math.random()*6) ;
   lava[0] = loadImage("lava0.png");
   lava[1] = loadImage("lava1.png");
   lava[2] = loadImage("lava2.png");
   lava[3] = loadImage("lava3.png");
   lava[4] = loadImage("lava4.png");
   lava[5] = loadImage("lava5.png");
  }
  void action(){
    animate();
    if(isTouching("Player")){
     
    }
  }
  void animate(){
    if(frame >= lava.length) frame= 0;
    if (frameCount%6 == 0){
     attachImage(lava[frame]);
     frame++;
    }
    
  }
  
  

  
  
}
