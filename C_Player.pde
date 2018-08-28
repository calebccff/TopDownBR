final int PLAY_SIZE = 40;
final int P_MOVESPEED = 7;

class Player extends MasterEntity{
  PVector frameVel;
  PVector dir;
  PVector dpos;

  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

  Player(){
    pos = new PVector(0, 0);
    dpos = pos.copy();
    size = new PVector(PLAY_SIZE, PLAY_SIZE); //Needed to prevent indexoutofbounds with master object
    dir = new PVector(10, 0);
    col = color(255, 200, 200);
  }

  void render(){
    dpos = PVector.sub(pos, scr.voff);
    fill(col);
    noStroke();
    ellipse(dpos.x*scr.scale, dpos.y*scr.scale, size.x*scr.scale, size.x*scr.scale);

    stroke(200, 50, 120); //The gun
    line(dpos.x*scr.scale, dpos.y*scr.scale, (dpos.x+dir.x)*scr.scale, (dpos.y+dir.y)*scr.scale);

    for(int i = bullets.size()-1; i >= 0; i--){
      bullets.get(i).render();
      if(bullets.get(i).dead){
        bullets.remove(i);
      }
    }
  }

  void move(){
    frameVel = new PVector(0, 0);
    int dir = getMovementDirection();
    if (dir != -23) { //-23 means no keys are being pressed
      float move = (float)dir;
      move = (360+move)%360;

      frameVel = PVector.fromAngle(radians(move-90)).setMag(P_MOVESPEED);
    }
    pos.add(frameVel);
    pos.x = constrain(pos.x, 0, MAP_SIZE);
    pos.y = constrain(pos.y, 0, MAP_SIZE);
    mouse();
  }

  void mouse(){
    dir = PVector.sub(PVector.mult(dpos, scr.scale), new PVector(mouseX, mouseY)); //Multipled by scale factor to count for mouse pos being wrong
    dir.setMag(50);
    dir.rotate(PI);
    if(mousePressed && !pmousePressed){
      shoot();
    }
  }

  int getMovementDirection(){//Calculates the direction to move in, -23 means don't move
    boolean w = keys.get(controls.get("up"));
    boolean s = keys.get(controls.get("down"));
    boolean a = keys.get(controls.get("left"));
    boolean d = keys.get(controls.get("right"));

    int x, z;
    if (w^s) {
      if (w) {
        x = 0;
      } else {
        x = 180;
      }
    } else {
      x = -23;
    }

    if (a^d) {
      if (a) {
        z = 270;
      } else {
        z = 90;
      }
    } else {
      z = -23;
    }

    if (x==-23&&z==-23) {
      return -23;
    }

    if (z == -23) {
      return x;
    } else if (x==-23) {
      return z;
    } else {
      return int(lerp(x, w&a?180-z:z, 0.5));
    }
  }

  void shoot(){
    bullets.add(new Bullet(this));
    println("Bang!");
  }

  void physics(){
    worldCollide();
    for(int i = bullets.size()-1; i >= 0; i--){
      bullets.get(i).physics();
    }
  }

  String toString(){
    return pos.toString()+"#"+bulletToString();
  }

  String bulletToString(){
    String ret = "";
    for(int i = 0; i < bullets.size(); i++){
      ret += bullets.get(i).toString()+"@";
    }
    if(ret.length() > 2){
      ret = ret.substring(0, ret.length()-2);
    }
    return ret;
  }
}

class NetworkPlayer extends Player{

  NetworkPlayer(String pos){
    super();
    update(pos);
    col = color(50, 150, 200);
  }

  void update(String d1) { //Takes a string from the server and gets the position
    String[] vals = d1.split(",");
    for (int i = 0; i < vals.length; i++) {
      vals[i] = vals[i].replace("[", "").replace(" ", "").replace("]", "");
    }
    float[] p = new float[3];
    for (int i = 0; i < vals.length; i++) {
      p[i] = Float.parseFloat(vals[i]);
    }
    pos.set(p[0], p[1], p[2]); //Works with 3d vectors but should be good with 2d
  }
  
  void render(){
    super.render();
    println("Rendered other player");
  }
}
