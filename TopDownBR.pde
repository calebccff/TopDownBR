import hypermedia.net.*;

Player player;
Screen scr;

ThreadHandler th;
Map map;

boolean pmousePressed, mouseReleased;

HashMap<String, NetworkPlayer> others = new HashMap<String, NetworkPlayer>();

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

  //Threading, MUST be the last thing to be created to avoid null pointers
  th = new ThreadHandler();
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

  fill(255);
  text(frameRate, 50, 50);
}


void render(){
  background(50);

  map.render();
  player.render();
  renderOthers();
}

void renderOthers(){
  for(NetworkPlayer o : others.values()){
    o.render();
  }
}
