//This function draws the BUILD screen
int count = 0;

void build() {
handleBuildClicks();
  drawMap();
  animateThings();
  drawBuildInterface();
  buildButtons();
  flashingSign();
  handleButtonClicks();
  
}

void flashingSign() {
  fill(blue);
  count++;
  if (count <= 20) {
    textSize(40);
    text ("BUILD MODE", 500, 70);
  } else if (count == 40) {
    count = 0;
  }
}


void buildButtons () {
  Play.show();
  Gun.show();
  Burst.show();
  Sniper.show();
}

void drawBuildInterface() {
  strokeWeight(1);
  stroke(MapText);
  fill(MapText);
  rect(900, height/2, 200, height);
  fill(MapStroke);
  text ( "Wave:" + n, 900, 50);
  text( "$: " + money, 120, 80);
  text( "Lives:" + lives, 100, 110);
}

void handleBuildClicks() {

     if (Play.clicked && canBuild != false) {
    mode = PLAY;
    canBuild = false;
  }
  
  if (Gun.clicked && money >= 30 && towerChosen()) {
    towerSelect = RESET;
    towers.add(new Tower(GUN, 0, 60));
    money = money - 30;
    canBuild =true;
  }

  if (Burst.clicked && money >= 70 && towerChosen()) {
    towerSelect = RESET;
    towers.add(new Tower(AOE, 40, 90));
    money = money - 70;
    canBuild = true;
  }

  if (Sniper.clicked && money >= 100 && towerChosen()) {
    towerSelect = RESET;
    towers.add(new Tower (SNIPER, 0, 120));
    money = money - 100;
    canBuild = true;
  }
 
}

boolean towerChosen () {
  return towerSelect == SELECT;
}
