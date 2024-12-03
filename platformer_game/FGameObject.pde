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
  
  
}
