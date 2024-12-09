class FGameObject extends FBox {
  
  FGameObject(){
     super(gridSize, gridSize);

  }
  
  void action(){
    
    
    
  }
  boolean isTouching(String s){
    onGround = false;
    ArrayList<FContact> contacts = getContacts();
    for(int i =0 ; i < contacts.size(); i++){
       FContact fc = contacts.get(i);
       if(fc.contains(s)){
         return true;
       }
       
       
    }
    return false;
  }
  
  String touchingOther(String s){
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
    
  }
  }
}
