void game(){
  //backdrop
  background(#00A554);
  fill(#00B245);
  noStroke();
  for(int i = 0; i < 12; i+=2){
    rect(i*(1000/12), 0, 1000/12, height);
  }
  println(left2vx+" , "+left2vy);
  strokeWeight(15);
stroke(255);
line(width/2,0,width/2,height);
line(0,height/2-goaly,goalx,height/2-goaly);
line(goalx,height/2-goaly,goalx,height/2+goaly);
line(0,height/2+goaly,goalx,height/2+goaly);
line(width,height/2-goaly,width-goalx,height/2-goaly);
line(width-goalx,height/2-goaly,width-goalx,height/2+goaly);
line(width,height/2+goaly,width-goalx,height/2+goaly);
fill(255);
strokeWeight(5);
circle(width/2,0,100);
tactileCirc(width/2,height,100);
stroke(button);
circle(width/2,height,100);
strokeWeight(5);
stroke(0);
fill(0);

//score
textSize(30);
fill(leftColor);
text(leftscore,width/2-25,30);
fill(rightColor);
text(rightscore,width/2+25,30);
//exit button
textSize(buttonSize);
textAlign(CENTER);
text("EXIT", width/2,height-12);
//timer
temp--;
updateTime();
textSize(120);
determineLead();
fill(winnerColor);
text(grandTimer, width/2,height/2+25);
//reset display
textSize(60);
text(genDisplay, width/2, height/2-25);

 //players
 
 //goalies
 
 fill(leftColor);
 circle(leftx,lefty,leftd);
 fill(rightColor);
 circle(rightx,righty,rightd);
  //center field players
 fill(leftColor2);
 circle(left2x,left2y,leftd);
 fill(rightColor2);
 circle(right2x,right2y,rightd);
 
 left2x += left2vx;
 left2y += left2vy;
 right2y += right2vy;
 right2x += right2vx;
 //ball
 fill(255);
 circle(ballx,bally,balld);

 ballx = ballx + vx;
 bally = bally+vy;
 //acceleration
 if(Math.abs(left2vx) < negligibleV){
   left2vx = 0;
 }
 if(Math.abs(left2vy) < negligibleV){
   left2vy = 0;
 }
 if(Math.abs(right2vx) <= negligibleV){
   right2vx = 0;
 }
 if(Math.abs(right2vy) <= negligibleV){
   right2vy = 0;
 }
  if(Math.abs(vx) <= negligibleV){
   vx = 0;
 }
 if(Math.abs(vy) <= negligibleV){
   vy = 0;
 }
 if(left2vx >= negligibleV ){
   
 left2vx -= negaccel;
 }
  if(left2vx <= -negligibleV){
   
 left2vx += negaccel;
 }
 if(left2vy >= negligibleV ){
   
 left2vy -= negaccel;
 }
  if(left2vy <= -negligibleV){
   
 left2vy += negaccel;
 }
 
  if(right2vx >= negligibleV ){
   
 right2vx -= negaccel;
 }
  if(right2vx <= -negligibleV){
   
 right2vx += negaccel;
 }
 if(right2vy >= negligibleV ){
   
 right2vy -= negaccel;
 }
  if(right2vy <= -negligibleV){
   
 right2vy += negaccel;
 }
 
 
 if(vx >= negligibleV ){
   
 vx -= negaccel;
 }
  if(vx <= -negligibleV){
   
vx += negaccel;
 }
 if(vy >= negligibleV ){
   
 vy -= negaccel;
 }
  if(vy <= -negligibleV){
   
vy += negaccel;
 }
//round resets (side-specific)
 if(ballx < balld/2 && bally >(height/2-goaly+balld/2) && bally < (height/2+goaly-balld/2)){
   rightscore++;
   timer = millis();
  reset();
   
 }
  if(ballx > width-balld/2 && bally >(height/2-goaly+balld/2) && bally < (height/2+goaly-balld/2)){
   leftscore++;
   timer = millis();
   reset();
 }

 //movement
 
 //left side players
 if (wkey ==true && lefty > height/2-goaly+leftd/2){
   lefty = lefty-6;
   
 }
 if(wkey ==true&& Math.abs(left2vy) <= maxV && left2y > leftd/2){
     left2vy -= posaccel;
  }
 if(left2y <= leftd/2){
   left2y = leftd/2;
   collisionShake();
 }
 if(skey == true && lefty < height/2+goaly-leftd/2){
   lefty = lefty + 6;
   
 }
 if(skey == true && Math.abs(left2vy) < maxV&& left2y < height-leftd/2){
     left2vy += posaccel;
   }
   if(left2y >= height-leftd/2){
   left2y = height-leftd/2;
   collisionShake();
 }
 if (akey ==true && leftx >0){
   leftx = leftx-6;
   
 }
 if(akey ==true && Math.abs(left2vx) < maxV&& left2x > leftd/2){
     left2vx -=posaccel;
   }
   if(left2x <= leftd/2){
   left2x = leftd/2;
   collisionShake();
 }
 if (dkey ==true && leftx < goalx-leftd/2){
   leftx = leftx+6;
   
 }
 if(dkey ==true && Math.abs(left2vx) < maxV&& left2y < width-leftd/2){
     left2vx +=posaccel;
   }
 if(left2x >= width-leftd/2){
   left2x = width -leftd/2;
   collisionShake();
 }
   
 //right side players
 if (upkey==true  && righty >height/2-goaly+leftd/2 && !playerOnplayerRightTeam()){ 
   righty = righty-6;
   
 }
 if(upkey==true && Math.abs(right2vy) < maxV&& right2y > rightd/2){
    right2vy -= posaccel;
   }
 if(right2y <= rightd/2){
   right2y = rightd/2;
   collisionShake();
 }
 if(downkey == true && righty < height/2+goaly-leftd/2 && !playerOnplayerRightTeam()){
   righty = righty + 6;
   
 }
 if(downkey == true && Math.abs(right2vy) < maxV && right2y < height-rightd/2){
     right2vy +=posaccel;
   }
 if(right2y >= height-leftd/2){
   right2y = height-leftd/2;
   collisionShake();
 }
 if (leftkey ==true && rightx > width-goalx+leftd/2 && !playerOnplayerRightTeam()){
   rightx = rightx-6;
   
 }
 if(leftkey ==true && Math.abs(right2vx) < maxV && right2x > rightd/2){
     right2vx -= posaccel;
   }
      if(right2x <= rightd/2){
   right2x = rightd/2;
   collisionShake();
 }
 if (rightkey ==true && rightx < width&& !playerOnplayerRightTeam()){ 
   rightx = rightx+6;
   
 }
if(rightkey ==true && Math.abs(right2vx) < maxV&& right2x < width- rightd/2){
      right2vx += posaccel;
   }
 if(right2x >= width-leftd/2){
   right2x = width-leftd/2;
   collisionShake();
 }

 //ball collisions
 if (dist(leftx,lefty,ballx,bally) <= leftd/2 + balld/2){
   vx = ((ballx - leftx))/6;
   vy = ((bally - lefty))/6;
 }
  if (dist(rightx,righty,ballx,bally) <= rightd/2 + balld/2){
   vx = ((ballx - rightx))/6;
   vy = ((bally - righty))/6;

 }
 if (dist(left2x,left2y,ballx,bally) <= leftd/2 + balld/2){
   vx += left2vx/1.5;
   vy += left2vy/1.5;
 }
  if (dist(right2x,right2y,ballx,bally) <= rightd/2 + balld/2){
   vx += right2vx/1.5;
   vy += right2vy/1.5;
 }
 
//player collisions

if(playerOnplayer()){
   left2vx *= -1;
   left2vy *= -1;
   right2vx *= -1;
   right2vy *=-1;
}
if(playerOnplayerLeftTeam()){
   left2vx *= -1;
   left2vy *= -1;
}
if(playerOnplayerRightTeam()){
   right2vx *= -1;
   right2vy *= -1;
}
 //border collisions
if (bally < balld || bally > height - balld){
    vy = vy* -1;
 
}
if (ballx < balld/2 || ballx > width - balld/2){
    vx = vx * -1;
 
}
if (left2y < leftd/2 || left2y > height - leftd/2){
    left2vy = (left2vy * -1);
 
}
if (left2x < leftd/2 || left2x > width - leftd/2){
    left2vx = left2vx * -1;
 
}
if (right2y < rightd/2 || right2y > height - rightd/2){
    right2vy = right2vy * -1;
 
}
if (right2x < rightd/2 || right2x > width - rightd/2){
    right2vx = right2vx * -1;
 
}


//ending
if(leftscore == 5 || rightscore == 5){
  genDisplay = "";
  mode = GAMEOVER;
}
if(grandTimer == -1){
  genDisplay = "";
  mode = GAMEOVER;
}
}
public boolean playerOnplayer(){
  if(dist(left2x,left2y, right2x,right2y) <= leftd/2+rightd/2){
    return true;
  }else return false;
}
public boolean playerOnplayerLeftTeam(){
  if(dist(left2x,left2y, leftx, lefty) <= leftd){
    return true;
  }else return false;
}
public boolean playerOnplayerRightTeam(){
  return false;
}
void gameClicks(){
  if(dist(mouseX,mouseY,width/2,height) < 100/2){
    exit();
  }
  
}
void collisionShake(){
  
  
}
void determineLead(){
  if(leftscore>rightscore) winnerColor = leftColor;
  else if(rightscore>leftscore) winnerColor = rightColor;
  else winnerColor = #343434;
}
void updateTime(){
  if(temp == 0){
    temp = 60;
    grandTimer--;
    
  }
  
}
void reset(){
  println("wtf");
   ballx = width/2;
   bally = height/2;
   leftx = 0;
   lefty =height/2;
   rightx = width;
   righty = height/2;
   left2x = width/2 - width/4;
   left2y = height/2;
   right2x = width/2 + width/4;
   right2y = height/2;
   right2vy = 0;
   right2vx = 0;
   left2vx = 0;
   left2vy = 0;
   vy = 0;
   vx= 0;

}
void tactileCirc(float x, float y, float d){
  if(dist(mouseX,mouseY,x,y) < d/2){
    button = #000000;
    buttonSize = 30;
  }
  else{
    button = #FFFFFF;
    buttonSize = 25;
  }
}
