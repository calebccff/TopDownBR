class ThreadHandler{
  HashMap<String, MasterThread> threads = new HashMap<String, MasterThread>();

  ThreadHandler(){
    threads.put("physics", new PhysThread());
    threads.put("movement", new MoveThread());

    for(MasterThread mt : threads.values()){ //Starts all the threads
      mt.create();
    }
  }

  void stopAll(){
    for(MasterThread mt : threads.values()){
      mt.stop = true;
    }
  }
}
