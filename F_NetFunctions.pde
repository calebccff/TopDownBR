int getNetItemType(String item){
  return int(item.substring(item.indexOf(","), item.indexOf("#"))); //Get's the net item type
}

int getNetItemID(String item){
  return int(item.substring(0, item.indexOf(","))); //Hardcoded = bad, use properties or JSON spec.
}

PVector propToPVector(String prop){
  String[] parts = prop.split(",");
  return new PVector(int(parts[0]), int(parts[1]));
}
