class Client{
  int id;

  PVector pos;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

  Client(String data, int id){
    update(data);
    this.id = id;
  }

  void update(String data){ //If it's not broken....
    if(data.substring(0, 3).equals("shot")){
      addBullet(data.substring(4, data.length()-2));
    }else{
      String[] parts = data.split("#");
      pos = PVFromString(parts[0]);
    }
  }

  void buffer(){
    buffer.startObject(0, id);
    buffer.addVal(pos);
    buffer.addVal(bullets);
    buffer.endObject(); //Use a unique ID not an IP Address, cuz that's dangerous
  }

  String toString(){
    return pos.toString()+bulletToString();
  }

  String bulletToString(){
    String ret = "";
    for(Bullet b : bullets){
      ret += b.toString();
    }
    return ret;
  }

  void addBullet(String s){
    bullets.add(new Bullet(PVFromString(s)));
  }
}

class Bullet{
  PVector pos;
  PVector vel;

  boolean dead;

  Bullet(PVector s){
    pos = s;
  }

  // void physics(){
  //   MasterObject hitWall = worldCollide();
  //   if(hit != null){
  //     dead = true;
  //   }
  //   pos.add(PVector.mult(dir, BULLET_VEL));
  // }

  // void render(){
  //   dpos = PVector.sub(pos, scr.voff);
  //   fill(150, 45, 80);
  //   ellipse(dpos.x*scr.scale, dpos.y*scr.scale, size.x*scr.scale, size.y*scr.scale);
  // }

  @Override
  String toString(){
    return pos.toString();
  }
}
