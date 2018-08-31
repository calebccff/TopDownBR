int newClientID(){
  int id;
  boolean valid = true;
  do{
    id = round(random(1000, 9999));
    for(Client c : clients.values()){
      if(id == c.id){
        valid = false;
      }
    }
  }while(!valid);
  return id;
}
