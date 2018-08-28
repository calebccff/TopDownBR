final int BULLET_VEL = 10;
final int BULLET_SIZE = 16;

class Bullet extends MasterEntity{
  PVector dir;
  PVector dpos;

  boolean dead = false;

  Bullet(Player p){
    pos = p.pos.copy();
    dpos = pos.copy();
    dir = p.dir.copy().normalize();

    size = new PVector(BULLET_SIZE, BULLET_SIZE);
  }

  void physics(){
    MasterObject hit = worldCollide();
    if(hit != null){
      dead = true;
    }
    pos.add(PVector.mult(dir, BULLET_VEL));
  }

  void render(){
    dpos = PVector.sub(pos, scr.voff);
    fill(150, 45, 80);
    ellipse(dpos.x*scr.scale, dpos.y*scr.scale, size.x*scr.scale, size.y*scr.scale);
  }

  String toString(){
    return pos.toString();
  }
}
