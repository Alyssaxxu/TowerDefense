//This function draws the INTRO screen.

void intro() {

  introGif.show();

  Maps.show();
  if (Maps.clicked) {
    mode = MAP;
  }

  textAlign (CENTER, CENTER);
  textFont (Paladins);
  fill(pink);
  text ( "Tower", width/2, height/2- 100);
  text ( "defense", width/2, height/2 );
}
