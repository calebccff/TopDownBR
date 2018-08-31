public class NetThread extends MasterThread{
  String lastPacket = "";
  UDP udp;

  NetThread(){
    TICKRATE = 64; //64 tick servers... high tick rate cuz no lag compensation
    //Networking
    udp = new UDP(this, 1235); //LISTEN PORT
    udp.listen(true);
  }

  void runLoop(){
    send(player.buffer()); //TODO: REFACTOR
    if(!lastPacket.equals("")){ //A new packet arrived!
      String[] items = lastPacket.split("}");
      for(String item : items){
        if(!item.contains("you") && getNetItemType(item) == 0){
          int id = getNetItemID(item);
          if(others.containsKey(id)){
            others.get(id).update(item);
          }
          else{ //New client connected
            others.put(id, new NetworkPlayer(item));
          }
        }
      }
    }
    lastPacket = "";
  }

  public void send(String msg){
    udp.send(msg, "127.0.0.1", 1234);
  }

  public void receive(byte[] _data, String ip, int port){
    lastPacket = new String(_data); //This adds 1 tick of latency
    println("Received: "+lastPacket.length());
  }

}

/*
String[] ot = lastPacket.split("@");
for(String o : ot){
  if(o.contains("you")){ //Ignore data about local... better alternative to not send it?
    continue;
  }
  String[] player = o.split("]"); //0.. is player data, last is ip
  if(others.containsKey(player[1])){
    others.get(player[1]).update(player[0]);
  }
  else{
    others.put(player[1], new NetworkPlayer(player[0]));
  }
}
*/
