import hypermedia.net.*;

final int MAP_SIZE = 4096;

String data = "";


HashMap<String, Client> clients = new HashMap<String, Client>();
Buffer buffer;

void setup(){
  size(600, 200);
  fill(255);

  buffer = new Buffer();
}

void draw(){
  background(50);

  for(Client c : clients.values()){
    c.display();
  }
  //TODO: Buffer things
  sendData();
  fill(50, 255, 50);
  text("Players: "+clients.values().size()+"\nClient Data: "+data, 10, 50);
}

void sendData(){
  for(Client c : clients.values()){
    c.buffer(); //The verb
  }
  buffer.flush(); //Sends data to all clients.
}
/*
void flush(){ //Sends data to clients
  String data = "";
  for(String k : clients.keySet()){
    data += clients.get(k).toString()+k+"@";
  }
  if(data.length() > 2){
    data = data.substring(0, data.length()-1); //Remove last @ sign
  }
  println("SERVER: sending"+data);
  for(String k : clients.keySet()){
    udp.send(data.replace(k, "you"), k, 1235);
  }
}*/
