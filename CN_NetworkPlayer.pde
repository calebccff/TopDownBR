class NetworkPlayer extends Player{
  //Don't need to store ID as it is used as the key

  NetworkPlayer(String s){
    super();
    update(s);
  }

  void update(String item) { //Takes a string from the server and gets the new data
    item = item.substring(item.indexOf("#"), item.length()); //Ignore metadata
    //More hardcoded getting of data, again use identifiers for data
    String[] props = item.split("]");
    pos = propToPVector(props[0]); //Use some count of nextProp method with an iterator.
    dir = propToPVector(props[1]);
    println(pos);
    for(int i = 2; i < props.length; i++){
      bullets.add(new Bullet(propToPVector(props[i]))); //All the bullets
    }
  }
}

/*
String[] vals = d1.split(",");
for (int i = 0; i < vals.length; i++) {
  vals[i] = vals[i].replace("[", "").replace(" ", "").replace("]", "");
}
float[] p = new float[3];
for (int i = 0; i < vals.length; i++) {
  p[i] = Float.parseFloat(vals[i]);
}
pos.set(p[0], p[1], p[2]); //Works with 3d vectors but should be good with 2d
*/
