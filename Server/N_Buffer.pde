/*Object types:
 - PLAYER
 - ITEM
 - ENTITY (interactables)
 - META (metadata)
*/

public class Buffer{
  UDP udp;
  String buffer = "";

  Buffer(){
    udp = new UDP(this, 1234);
    udp.listen(true);
  }

  void addVal(PVector pv){
    buffer += pv.x+","+pv.y+"]";
  }

  void addVal(int i){
    buffer += i+"]";
  }

  void addVal(String s){
    buffer += s+"]";
  }

  void startObject(int type){
    buffer += "{"+type+"#";
  }

  void endObject(){
    buffer += "}";
  }

  void flush(){ //Sends data to clients
    String data = "";
    for(String k : clients.keySet()){
      data += clients.get(k).toString()+k+"@";
    }
    if(data.length() > 2){
      data = data.substring(0, data.length()-1); //Remove last @ sign
    }
    println("SERVER: sending"+data);
    for(String k : clients.keySet()){
      udp.send(data.replace(k, "you"), k, 1235);
    }
  }

  void receive(byte[] _data, String ip, int port){
    String data = new String(_data);
    if(clients.containsKey(ip)){
      clients.get(ip).update(data);
    }else{
      clients.put(ip, new Client(data));
    }
  }
}

class OType{
  int PLAYER = 0;
  int ITEM = 1;
  int ENTITY = 2;
  int META = 3;
}
