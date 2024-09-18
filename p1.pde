void p1(){
  
  int n = 20;
  for(int i = 0; i < n; i++){
     
    float temp = (float)(Math.random()*1000)+100;
    strokeWeight(5);
    noFill();
    stroke(white);
    circle(400,400,temp);
    strokeWeight(1);
    stroke(0);
    fill(1);
    delay(((int)temp/10)/100);
  }
  
}
