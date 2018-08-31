PVector PVFromString(String d){ //Converts a pvector from string representation to PVector object
  String[] vals = d.split(",");
  for(int i = 0; i < vals.length; i++){
    vals[i] = vals[i].replace("[", "").replace(" ", "").replace("]", "");
  }
  float[] p = new float[3];
  for(int i = 0; i < vals.length; i++){
    p[i] = Float.parseFloat(vals[i]);
  }
  return new PVector(p[0], p[1], p[2]);
}

int getNetItemType(String item){ //When does indexOf return -4????
  println(item);
  return int(item.substring(0,
  item.indexOf("#"))); //Get's the net item type
}

int getNetItemID(String item){
  return int(item.substring(0, item.indexOf(","))); //Hardcoded = bad, use properties or JSON spec.
}

PVector propToPVector(String prop){
  prop = prop.substring(1, prop.length()); //Remove the leading # (This is what broke it)
  String[] parts = prop.split(",");
  return new PVector(int(parts[0]), int(parts[1]));
}
