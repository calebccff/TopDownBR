final int BULLET_VEL = 10;
final int BULLET_SIZE = 16;

class Bullet extends MasterEntity{
  PVector dir;
  PVector dpos;
  int life = 0;

  boolean dead = false;

  Bullet(Player p){
    pos = p.pos.copy();
    dpos = pos.copy();
    dir = p.dir.copy().normalize();

    size = new PVector(BULLET_SIZE, BULLET_SIZE);
  }

  Bullet(PVector pos){
    this.pos = pos;
    dpos = pos.copy();
    dir = new PVector(0, 0); //Don't do local physics on other players bullets.
  }

  void physics(){
    life++;
    MasterObject hit = worldCollide();
    if(hit != null || life < 1200){
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
