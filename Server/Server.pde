import hypermedia.net.*;

final int MAP_SIZE = 4096;

UDP udp;
HashMap<String, Client> clients = new HashMap<String, Client>();

void setup(){
  size(400, 400);
  fill(255);

  udp = new UDP(this, 1234);
  udp.log(true);
  udp.listen(true);
}

void draw(){
  background(50);

  for(Client c : clients.values()){
    ellipse(c.pos.x/100, c.pos.y/100, 20, 20);
  }
}
