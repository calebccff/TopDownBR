HashMap<Character, Boolean> keys = new HashMap<Character, Boolean>();
HashMap<Character, Boolean> keysToggle = new HashMap<Character, Boolean>();
HashMap<String, Character> controls = new HashMap<String, Character>();

void initKeys(){
  controls.put("up", 'w'); //Movement
  controls.put("down", 's');
  controls.put("left", 'a');
  controls.put("right", 'd');

  controls.put("weapon1", '1');
  controls.put("weapon2", '2');

  for(Character c : controls.values()){
    keys.put(c, false);
  }
}

void keyPressed(){
  if(keys.containsKey(key)){
    keys.put(key, true);
  }
  if(keysToggle.containsKey(key)){
    keysToggle.put(key, !keysToggle.get(key));
  }

  if(key == 'i'){
    scr.scale += 0.2;
  }
  else if(key == 'k'){
    scr.scale -= 0.2;
  }
}

void keyReleased(){
  if(keys.containsKey(key)){
    keys.put(key, false);
  }
}
