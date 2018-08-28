abstract class MasterObject{
  PVector pos; //Center of object
  PVector size;
  int bottom;
  int top;
  color col;

  MasterObject(){
    pos = new PVector();
    size = new PVector();
  }

  abstract void render();
  abstract void physics();

  float getTop(){
    return pos.y-size.y/2;
  }
  float getBottom(){
    return pos.y+size.y/2;
  }
  float getLeft(){
    return pos.x-size.x/2;
  }
  float getRight(){
    return pos.x+size.x/2;
  }
}

abstract class MasterEntity extends MasterObject{
  MasterObject worldCollide(){ //Colision with walls and stuff
    MasterObject ret = null;
    ArrayList<MapBlock> objects = map.getNearest(pos, size, 50);

    for(MapBlock mb : objects){

      if(getRight() > mb.getLeft() && getLeft() < mb.getRight()
       && getBottom() > mb.getTop() && getTop() < mb.getBottom()){ //Collide with object
        float min = 99999;
        int minid = -1;
        if(dist(pos.x, 0, mb.getLeft(), 0) < min){
          min = dist(pos.x, 0, mb.getLeft(), 0);
          minid = 0;
        }
        println("0 : "+min);
        if(dist(pos.x, 0, mb.getRight(), 0) < min){
          min = dist(pos.x, 0, mb.getRight(), 0);
          minid = 1;
        }
        println("1 : "+min);
        if(dist(0, pos.y, 0, mb.getTop()) < min){
          min = dist(0, pos.y, 0, mb.getTop());
          minid = 2;
        }
        println("2 : "+min);
        if(dist(0, pos.y, 0, mb.getBottom()) < min){
          min = dist(0, pos.y, 0, mb.getBottom());
          minid = 3;
        }
        println("3 : "+min);
        switch(minid){
          case 0:
            pos.x = mb.getLeft()-size.x/2;
            break;
          case 1:
            pos.x = mb.getRight()+size.x/2;
            break;
          case 2:
            pos.y = mb.getTop()-size.y/2;
            println(pos.y);
            break;
          case 3:
            pos.y = mb.getBottom()+size.y/2;
        }
        if(ret == null){
          ret = mb;
        }
      }

    }
    return ret; //Returns first object ent collided with, null if no object
  }
}
