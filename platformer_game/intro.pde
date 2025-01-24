void intro(){
  background(255);
  textAlign(CENTER);
  textSize(140);
  fill(0);
  text("FLAPPY BIRD PLATFORMER", width/2,300);
  strokeWeight(5);
  //with friends
  tactileRect(width/2-100,400,200,100);
  fill(50);
  rect(width/2-100,400, 200,100);
  
  
  
}
void introClicks(){
  if(mouseX > width/2-100 && mouseX < width/2+100 && mouseY > 400 && mouseY < 400+100){
   mode = GAME;
   if(firstRun){
     init();
     firstRun =false;
   }
   else reinit();
  }
  
}
void reinit(){
  println("running");
  if(save1){
    spawnx = 1000;
    spawny = 1200;
  }else if(save2){
    //spawnx = 
    //spawny = 
  }else {
    spawnx = 0; 
    spawny = 0;
  }
  gameOver = false;
  playerDead = false;
  deathframe = 0;
  loadPlayer();
}
void init(){
  
  lowBound = 4000;
  Fisica.init(this);
  world = new FWorld(-3000,-4000,10000,lowBound);
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();
  projectiles = new ArrayList<FBox>();
  checkpoints=  new ArrayList<FSwitchSave>();
  for(int i = 0; i< checkpoints.size();i++){
    checkpoints.get(i).setCurrentSave(false);
  }
  world.setGravity(0,980);
  L = -1;
  R = 1;
  U = -1;
  D = 1;
  flyMode = false;
  loadMap();
  loadPlayer();
  gameOver = false;
  deathScreen = loadImage("death.png");
  camera = loadImage("camera.png");
  cameraObj = new FBox(gridSize,gridSize);
  background= loadImage("bsck.jpg");
}
