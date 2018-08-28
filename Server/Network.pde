
void send(){
  String data = "";
  for(String k : clients.keySet()){
    data += clients.get(k).toString()+k+"@";
  }
  if(data.length() > 2){
    data = data.substring(0, data.length()-1); //Remove last @ sign
  }
  println(data);
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
