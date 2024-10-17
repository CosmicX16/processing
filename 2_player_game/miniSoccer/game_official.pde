int mode;
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;
int rightscore,leftscore,timer,temp, grandTimer,countConstant;
float leftx,lefty,leftd,rightx,righty,rightd,left2x,left2y,right2x,right2y,vx,vy,goaly,goalx,left2vx,right2vx,left2vy,right2vy, negaccel,posaccel, maxV;
float ballx,bally,balld,textPos, buttonSize,negligibleV;
boolean wkey,skey,akey,dkey,upkey,downkey,leftkey,rightkey, freeze;
color leftColor = #FA0000;
color leftColor2=  #FA5353;
color rightColor = #0C05FF;
color rightColor2 = #5752F7;
color button;
color winnerColor;
String genDisplay;
void setup(){
  size (1000,600);
  mode = INTRO;
 leftx = 0;
 lefty = height/2;
 leftd = 50;
 
 rightx = width;
 righty=height/2;
 rightd = 50;
 
 ballx = width/2;
 bally = height/2;
 balld = 30;
 
 goaly = 100;
 goalx = 75;
 vx = 0;
 vy = 0;
 negaccel = 0.25;
 posaccel = 0.5;
 maxV = 10;
 negligibleV = 0.25;
 
 left2x = width/2 - width/4;
 left2y = height/2;
 right2x = width/2 + width/4;
 right2y = height/2;
 left2vx = 0;
 left2vy = 0;
 right2vx = 0;
 right2vy = 0;
 
 
 rightscore  = 0;
 leftscore = 0;
 grandTimer = 120;
 temp = 60;
 countConstant = 1;
 genDisplay  ="";
 textPos = width/2;
 buttonSize = 40;
 }

void draw()
{
  if (mode== INTRO)
  {
    
    intro();
  } else if (mode == GAME)
  {
    
    game();
  } else if (mode == GAMEOVER)
  {
    gameover();
  } else
  {
    println("Error : Mode = " + mode);
  }
  
  
  
  
}
