public class NetThread extends MasterThread{
  String lastPacket = "";
  UDP udp;

  NetThread(){
    TICKRATE = 30;
    //Networking
    udp = new UDP(this, 1235); //LISTEN PORT
    udp.listen(true);
  }

  void runLoop(){
    send(player.toString());
    if(!lastPacket.equals("")){ //A new packet arrived!
      String[] ot = lastPacket.split("@");
      for(String o : ot){
        if(o.contains("you")){
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
    }
    lastPacket = "";
  }

  public void send(String msg){
    udp.send(msg, "127.0.0.1", 1234);
  }

  public void receive(byte[] _data, String ip, int port){
    lastPacket = new String(_data);
    println("Received: "+lastPacket);
  }

}
