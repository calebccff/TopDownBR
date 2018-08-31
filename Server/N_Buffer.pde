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

  void addVal(Object o){ //Tries to use standard toString() method.
    buffer += o.toString()+"]";
  }

  void addVal(ArrayList ar){ //Iterates and adds each object!
    for(Object o : ar){
      addVal(o);
    }
  }

  void addVal(int i){
    buffer += i+"]";
  }

  void addVal(String s){
    buffer += s+"]";
  }

  void startObject(int type, int id){
    buffer += id+","+type+"#";
  }

  void endObject(){
    buffer += "}";
  }

  String withoutObjectID(int id){
    int oStart = int(buffer.indexOf(str(id)));
    int oEnd = int(buffer.substring(oStart, buffer.indexOf("}")));

    String before = buffer.substring(0, constrain(oStart-1, 0, MAX_INT)); //Only 1 client...
    String after = buffer.substring(oEnd, buffer.length()-1);
    //println(before+"@"+after);
    return before+after;
  }

  void flush(){ //Sends data to clients
    //println("SERVER: sending"+buffer);
    for(String k : clients.keySet()){
      udp.send(buffer.replace(str(clients.get(k).id), "you"), k, 1235); //Send the data to each client, filtering out their own data
    }
    buffer = ""; //Gotta reset the buffer after each flush....
  }
/*Example data:
{1732,0#340.12,750.438]234.58,85.3]}
1732 - serverside entity id (Also used for other items?)
0 - Object type
# - End of metadata
340.12,750.438 - Position of entity
] - Seperator, each value is followed by this
} - Object seperator
*/

  void receive(byte[] _data, String ip, int port){
    println(ip);
    println(clients.keySet());
    String data = new String(_data);
    if(clients.containsKey(ip)){
      println("Updated existing client");
      clients.get(ip).update(data);
    }else{
      println("Created new client");
      clients.put(ip, new Client(data, newClientID()));
    }
  }
}

class OType{
  int PLAYER = 0;
  int ITEM = 1;
  int ENTITY = 2;
  int META = 3;
}