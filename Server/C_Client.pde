class Client{
  String ip;

  PVector pos;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

  Client(String data){
    update(data);
  }

  void update(String data){
    if(data.substring(0, 3).equals("shot")){
      addBullet(data.substring(4, data.length()-2));
    }else{
      String[] parts = data.split("#");
      pos = PVFromtString(parts[0]);
    }
  }

  String toString(){
    return pos.toString()+"#"+bulletToString();
  }

  String bulletToString(){
    String ret = "";
    for(Bullet b : bullets){
      ret += b.toString()+"@";
    }
    return ret.substring(0, ret.length()-2);
  }

  void addBullet(String s){
    bullets.add(new Bullet(PVFromtString(s)));
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

  String toString(){
    return pos.toString();
  }
}
