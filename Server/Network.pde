
void send(String msg, String ip){

}

void receive(byte[] _data, String ip, int port){
  String data = new String(_data);
  println(data);
  if(clients.containsKey(ip)){
    clients.get(ip).update(data);
  }else{
    clients.put(ip, new Client(data));
  }
}
