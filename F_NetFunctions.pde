int getNetItemType(String item){
  return int(item.substring(item.indexOf(","), item.indexOf("#"))); //Get's the net item type
}

int getNetItemID(String item){
  return int(item.substring(0, item.indexOf(","))); //Hardcoded = bad, use properties or JSON spec.
}

PVector propToPVector(String prop){
  //println(prop);
  prop = prop.substring(1, prop.length()); //Remove the leading # (This is what broke it)
  String[] parts = prop.split(",");
  return new PVector(float(parts[0]), float(parts[1]));
}
