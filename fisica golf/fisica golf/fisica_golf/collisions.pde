void collisions(){
 

  
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