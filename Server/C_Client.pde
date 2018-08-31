class Client{
  int id;

  PVector pos;
  PVector dir;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

  Client(String data, int id){
    update(data);
    this.id = id;
  }

  void display(){
    noStroke();
    fill(255);
    ellipse(pos.x/10, pos.y/10, 20, 20);
    stroke(50, 50, 230);
    line(pos.x/10, pos.y/10, pos.x/10+dir.x/10, pos.y/10+dir.x/10); //BAD
  }

  void update(String data){
    data = data.substring(data.indexOf("#"), data.length()); //Ignore metadata
    //More hardcoded getting of data, again use identifiers for data
    String[] props = data.split("]");
    pos = propToPVector(props[0]);
    dir = propToPVector(props[1]);
    for(int i = 2; i < props.length; i++){
      bullets.add(new Bullet(propToPVector(props[i]))); //All the bullets
    }
  }
  /*
  if(data.substring(0, 3).equals("shot")){
    addBullet(data.substring(4, data.length()-2));
  }else{
    String[] parts = data.split("#");
    pos = PVFromString(parts[0]);
  }*/

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
