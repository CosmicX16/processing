void game(){
  background(background);
  drawWorld();
  useCamera();
  
  textSize(25);
  
  text((int)cameraObj.getX() + "  " +(int)cameraObj.getY(), width-40,40);
  if(playerDead){
    deathframe += 2;
    tint(255,deathframe*1.4 );
    image(deathScreen,0,0);
  }
  if (deathframe >= 180) {
    
      gameOver=  true;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
void useCamera(){
  if(!playerDead){
    cameraObj.setPosition(player.getX(),player.getY());
    
  }
  else {
    
  }
}
void drawWorld(){
  pushMatrix();
  translate(-cameraObj.getX()*zoom+width/2, -cameraObj.getY()*zoom+height/2); 
  scale(zoom);
  
  world.step();
  world.draw();
  if(!playerDead) actWorld();
  popMatrix();
  //zoom += Math.random()*0.01 - 0.005;
  if(gameOver){
    fadeTimer = 0;
    mode = GAMEOVER;
    
  }
}
void actWorld(){
  player.action();
  
  for(int i =0; i< terrain.size(); i++){
    FGameObject obj = terrain.get(i);
    if(obj.getY()+obj.getHeight()/2 >= lowBound - 20) world.remove(obj);
    obj.action();
    
  }
  for(int i = 0; i < enemies.size(); i++){
   FGameObject obj = enemies.get(i);
   if(obj.getY()+obj.getHeight()/2 >= lowBound -20) world.remove(obj);
   obj.action();
    
  }
  for(int i =0; i< projectiles.size(); i++){
    FBox obj = projectiles.get(i);
    if(obj.getY()+obj.getHeight()/2 >= lowBound-20) world.remove(obj);
    
    
  }
  
  for(int i =0; i< projectiles.size(); i++){
    FBox obj = projectiles.get(i);
    if(obj.getY()+obj.getHeight()/2 >= lowBound-20) world.remove(obj);
    
    
  }
  for(int i =0; i< checkpoints.size(); i++){
    FSwitchSave obj = checkpoints.get(i);
    obj.action();
    }
    controlSaves();
}
void controlSaves(){
  if(save1Obj.isOn()) save1 = true;
  else if(save2Obj.isOn()) save2= true;
  
  if(save1) save2Obj.setCurrentSave(false);
  if(save2) save1Obj.setCurrentSave(false);
  
}
void loadPlayer(){
  player = new FPlayer();
  
  world.add(player);
  player.setPosition(spawnx,spawny);
  
}
void loadMap(){
  map = loadImage("map.png");
  for(int y = 0; y < map.height; y++){
    for(int x  =0;x< map.width; x++){
      color c = map.get(x,y);
      if(c == grass){
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        PImage p = loadImage("dirt_n.png");
         b.attachImage(p);
        b.setStatic(true);
        b.setName("ground");
        b.setFriction(4);
        world.add(b);
      }else if(c == grassWall){
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        PImage p = loadImage("dirt_n.png");
         b.attachImage(p);
        b.setStatic(true);
        b.setName("wall");
        b.setFriction(4);
        world.add(b);
      
      
      
      }else if(c == dirt){
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        PImage p = loadImage("dirt_center.png");
        b.attachImage(p);
        b.setStatic(true);
        b.setName("ground");
        world.add(b);
      
      }else if(c== ice){
        PImage p = loadImage("water4.png");
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        b.attachImage(p);
        b.setFriction(0.5);
        b.setStatic(true);
        b.setName("ice");
        world.add(b);
        
      }else if(c== tram){
        PImage p = loadImage("trampoline.png");
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        b.attachImage(p);
        b.setStatic(true);
        b.setRestitution(2);
        b.setName("ground");
        world.add(b);
        
      }else if(c == spike){
        PImage p = loadImage("spike.png");
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        b.attachImage(p);
        b.setStatic(true);
        b.setName("harm");
        world.add(b);
        
      }else if (c == treetrunk){
        PImage p = loadImage("pipetop.png");
        FBox b = new FBox(gridSize,gridSize);
        b.setPosition(x*gridSize,y*gridSize);
        b.attachImage(p);
        b.setSensor(true);
        b.setStatic(true);
        b.setName("background");
        world.add(b);
        
     }else if (c == treeleaf){
       PImage p = loadImage("pipetrunk.png");
       FBox b = new FBox(gridSize,gridSize);
       b.setPosition(x*gridSize,y*gridSize);
       b.attachImage(p);
       b.setStatic(true);
       b.setName("harm");
       world.add(b);
        
     }else if (c == lava){
       FLava b = new FLava(x*gridSize,y*gridSize);
       //world.add(b);
       terrain.add(b);
       b.setName("harm");
     }else if (c == bridge){
       FBridge b = new FBridge(x*gridSize,y*gridSize);
       world.add(b);
       terrain.add(b);
       b.setName("ground");
     }else if (c == goomba){
       FGoomba b = new FGoomba(x*gridSize,y*gridSize);
       world.add(b);
       enemies.add(b);
       
     }else if (c == koopa){
       FKoopa b = new FKoopa(x*gridSize,y*gridSize);
       world.add(b);
       enemies.add(b);
   
     }else if (c == hammerguy){
       FHammerBro b = new FHammerBro(x*gridSize,y*gridSize);
       world.add(b);
       enemies.add(b);

     }else if (c == boo){
       FBoo b = new FBoo(x*gridSize,y*gridSize);
       world.add(b);
       enemies.add(b);

     }else if (c == thwomp){
       FThwomp b = new FThwomp(x*gridSize,y*gridSize);
       world.add(b);
       enemies.add(b);
     }else if (c == saveBlock1){
       save1Obj = new FSwitchSave(x*gridSize,y*gridSize);
       save1Obj.setName("save1");
       world.add(save1Obj);
       checkpoints.add(save1Obj);
     }else if (c == saveBlock2){
       save2Obj = new FSwitchSave(x*gridSize,y*gridSize);
       save2Obj.setName("save2");
       world.add(save2Obj);
       checkpoints.add(save2Obj);
    }else if (c == modeBlock){
       FSwitchMode b = new FSwitchMode(x*gridSize,y*gridSize);
       world.add(b);
       terrain.add(b);
    }else if (c == boss){
       FBoss b = new FBoss(x*gridSize,y*gridSize);
       world.add(b);
       enemies.add(b);
    }
    }
  }
}
boolean hitBody(FBody b, FBody c){
    ArrayList<FContact> contacts = b.getContacts();
    int i = 0;
    while(i < contacts.size()){
      FContact tempContact = contacts.get(i);
      if(tempContact.contains(c)) return true;
      i++;
    }
    return false;
}
