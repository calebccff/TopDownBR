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
