import processing.sound.*;

import fisica.*;
FWorld world;
FPlayer player;
FBox cameraObj;
PFont bird,arial;
FSwitchSave save1Obj,save2Obj;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;
ArrayList<FBox> projectiles;
ArrayList<FSwitchSave> checkpoints;
int L, R, U, D;
int deathframe;
int fadeTimer;
int mode;

final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;

SoundFile intro, game, gameover, death,hurt,fly,press,jump,kill;
float lowBound;
float spawnx,spawny;
float zoom = 0.9;
color grass = #000000;
color grassWall = #3E3E3E;
color dirt = #646764;
color tram = #FF0000;
color ice = #0000FF;
color spike = #EAFF08;
color treetrunk = #08FF2E;
color treeleaf = #34FF9E;
color treecenter = #47FCA6;
color bridge = #898989;
color lava = #8B0D0D;
color goomba = #640000;
color thwomp = #86A1FF;
color koopa = #006444;
color boo = #046400;
color hammerguy = #190064;
color saveBlock1 = #B78585;
color saveBlock2 = #A09E9E;
color modeBlock =#8587B7;
color boss = #32D8AD;
boolean wkey,akey,skey,dkey,upkey,downkey,rightkey,leftkey, ekey, spacekey, flyMode,onGround, tabkey ,playerDead,gameOver;
boolean save1, save2, firstRun;
PImage map;
PImage camera;
PImage deathScreen;
PImage background;
final int maxLives = 5;
int gridSize = 32;


void setup(){
  firstRun = true;
  size(1000,1000);
  bird = createFont("FlappyBirdy.ttf", 128);
  
  textFont(bird);
}

void draw(){
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
void tactileRect(float x, float y,float w, float h){
  if(mouseX>x && mouseX < x+w && mouseY>y && mouseY<y+h){
    stroke(255,0,0);
  }
  else
  {
    stroke(0);
  }
}
