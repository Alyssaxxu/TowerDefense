void Maps() {
  background (0);
  //start.show();
  Galaxy.show();
  Jungle.show();

  if (Galaxy.clicked) {
    MapText = purple;
    MapStroke = pink;
    MapFill = black;
    MapType = 1;
    p = 16;
    nodes = map1nodes;
    mode = PLAY;
  }
  if (Jungle.clicked) {
    MapStroke = green;
    MapFill = orange;
    MapType = 2;
    p=8;
    nodes = map2nodes;
    mode = PLAY;
  }

  textAlign (CENTER, CENTER);
  textFont (Paladins);
  textSize( 50);
  fill(pink);
  text ( "Map", width/2, 100);
  text ( "Selection", width/2, 170);

  textSize(30);
  fill(white);
  text("Galaxy", 300, 570);
  text ("Jungle", 700, 570);
}
