class Screen{
  PVector voff; //Represents the top left of the screen
  float scale;

  Screen(){
    voff = new PVector(0, 0);
    scale = 0.5;
  }

  void move(){
    voff.x = constrain(player.pos.x-(width/scr.scale)/2, 0, MAP_SIZE-width/2);
    voff.y = constrain(player.pos.y-(height/scr.scale)/2, 0, MAP_SIZE-height/2);

  }
}
