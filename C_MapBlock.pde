class MapBlock extends MasterObject{

  MapBlock(JSONObject o){
    JSONObject corners = o.getJSONObject("corners");
    JSONObject jo1 = corners.getJSONObject("1");
    JSONObject jo2 = corners.getJSONObject("2");
    PVector c1 = new PVector(jo1.getFloat("x"), jo1.getFloat("y"));
    PVector c2 = new PVector(jo2.getFloat("x"), jo2.getFloat("y"));
    pos = new PVector(lerp(c1.x, c2.x, 0.5), lerp(c1.y, c2.y, 0.5));
    size = new PVector(abs(c1.x-c2.x), abs(c1.y-c2.y));

    JSONArray c = o.getJSONArray("colour");
    col = color(c.getInt(0), c.getInt(1), c.getInt(2));
  }

  void render(){
    fill(col);
    noStroke();
    rect((pos.x-scr.voff.x)*scr.scale, (pos.y-scr.voff.y)*scr.scale, size.x*scr.scale, size.y*scr.scale);
  }

  void physics(){
  }


}
