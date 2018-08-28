import hypermedia.net.*;

Player player;
Screen scr;

ThreadHandler th;
Map map;

boolean pmousePressed, mouseReleased;

UDP udp;

void settings(){
  size(1280, 720);
  noSmooth(); //Forces antialiasing to be disabled so graphics don't get blurred when scaled.
}

void setup(){
  surface.setResizable(true);

  rectMode(CENTER);

  initKeys();
  map = new Map("test0");

  player = new Player();
  scr = new Screen();

  th = new ThreadHandler();

  //Networking
  udp = new UDP(this, 1235); //LISTEN PORT
  udp.listen(true);
}

void draw(){
  background(150);
  render();
  fill(255);
  for(int i = 0; i < width/32; i++){
    text(i, i*32, 10);
  }
  for(int j = 0; j < width/32; j++){
    text(j, 10, j*32);
  }
}


void render(){
  background(50);

  map.render();
  player.render();
}
