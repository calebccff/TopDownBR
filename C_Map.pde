class Map{
  ArrayList<MapBlock> objects = new ArrayList<MapBlock>();

  Map(String mapName){
    loadMap(mapName);
  }

  void loadMap(String mapName){
    JSONArray mapArr = loadJSONArray("maps/"+mapName+".json");
    for(int i = 0; i < mapArr.size(); i++){
      objects.add(new MapBlock((JSONObject)mapArr.get(i)));
    }
  }

  ArrayList<MapBlock> getNearest(PVector pos, PVector size, int radius){ //Returns all mapblocks within a radius of the position specified
    ArrayList<MapBlock> toReturn = new ArrayList<MapBlock>();
    for(MapBlock mb : objects){
      if(dist(pos.x, pos.y, mb.pos.x, mb.pos.y) < radius+mb.size.mag()/2+size.mag()/2){
        toReturn.add(mb);
      }
    }
    return toReturn;
  }

  void render(){
    for(int i = 0; i < objects.size(); i++){
      objects.get(i).render();
    }
  }

  void physics(){ //Moving objects etc

  }
}
