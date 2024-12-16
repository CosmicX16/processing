class FGameObject extends FBox {
  boolean death;
  int deathframe;
  FGameObject(){
     super(gridSize, gridSize);
     death = false;
  }
  
  void action(){
    
    
    
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
  FBody touchingObj(String s){
    
    ArrayList<FContact> contacts = getContacts();
    for(int i =0 ; i < contacts.size(); i++){
       FContact fc = contacts.get(i);
       FBody a = fc.getBody1();
       FBody b = fc.getBody2();
       FBody other;
       if (a == this)
         other = b;
       else 
         other = a;
       if(other.getName().equals(s)) return other;
    }
    return this;
    
  }
  boolean touchingOther(String s){
    ArrayList<FContact> contacts = getContacts();
    for(int i =0 ; i < contacts.size(); i++){
       FContact fc = contacts.get(i);
       FBody a = fc.getBody1();
       FBody b = fc.getBody2();
       FBody other;
       if (a == this)
         other = b;
       else 
         other = a;
       if(other.getName().equals(s)) return true;
    }
    return false;
  }
  void die(){
    
    if (death) {
      println("working");
      setStatic(true);
      deathframe += 3;
      setImageAlpha(map(deathframe, 0, 100, 255, 0));
    }
    if (deathframe >= 100) {
      world.remove(this);
    }
  }
  void dieDrop(){
    
    if (death) {
      println("working");
      setStatic(true);
      deathframe += 3;
      setImageAlpha(map(deathframe, 0, 100, 255, 0));
    }
    if (deathframe >= 100) {
      world.remove(this);
      FShell s = new FShell(getX(),getY());
      world.add(s);
    }
    
  }
  public boolean getIsDead(){
    return death;
  }
  
}
