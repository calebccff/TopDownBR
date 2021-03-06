abstract class MasterThread extends Thread{
  private Thread t;
  int TICKRATE;
  boolean stop = false;

  MasterThread(){
    TICKRATE = 60;
  }

  abstract void runLoop();

  void run(){
    while(!stop){
      int fstart = millis(); //Frame start time
      runLoop();
      delay(constrain( 1000/TICKRATE-(millis()-fstart) , 0, 1000/TICKRATE)); //To maintain a consistent tickrate, it's 1/60 seconds - frame time
    }
  }

  void create(){
    if(t == null){
      t = new Thread(this, "PHYS_THREAD");
      t.start();
    }
  }
}
