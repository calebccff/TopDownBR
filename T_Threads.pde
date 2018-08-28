class PhysThread extends MasterThread{ //Thread to do all the physics interactions, this might need to be server side

  PhysThread(){
    TICKRATE = 120;
  }

  void runLoop(){
    player.physics();
  }
}

class MoveThread extends MasterThread{

  MoveThread(){
    TICKRATE = 60;
  }

  void runLoop(){
    mouseReleased = pmousePressed && !mousePressed;
    player.move();
    scr.move();
    pmousePressed = mousePressed;
  }
}

class NetThread extends MasterThread{

  NetThread(){
    TICKRATE = 30;
  }

  void runLoop(){
    String toSend = "";
    
  }
}
