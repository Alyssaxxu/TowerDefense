//This function draws the PLAY screen
int n = 0;
int m = 0;
//Mob [] mobs;
void play() {
  drawMap();
  animateThings();
  drawPlayInterface();
  handleButtonClicks();

  if (lives == 0) {
    mode = GAMEOVER;
  }
}

void drawMap() {

  // reset stroke
  stroke(black);
  strokeWeight(2);

  background(MapFill);
  stroke( MapStroke);
  strokeWeight(30);

  if (MapType == JungleMap) {
    line(0, 400, 200, 400);
    line(200, 400, 200, 200);
    line(200, 200, 400, 200);
    line(400, 200, 400, 600);
    line(400, 600, 300, 600);
    line(300, 600, 300, 500);
    line(300, 500, 500, 500);
    line(500, 500, 500, 400);
    line(500, 400, 800, 400);
  } else if (MapType == GalaxyMap) {
    line(0, 400, 200, 400);
    line(200, 400, 200, 650);
    line(200, 650, 400, 650);
    line(400, 650, 400, 300);
    line(400, 300, 300, 300);
    line(300, 300, 300, 150);
    line(300, 150, 600, 150);
    line(600, 150, 600, 400);
    line(600, 400, 800, 400);
  }
}

void drawPlayInterface() {
  //toolbar
  strokeWeight(1);
  stroke(MapText);
  fill(MapText);
  rect(900, 400, 200, 800);
  // text stuff
  textFont (Paladins);
  textSize(20);
  fill(MapStroke);
  text ( "Wave:" + n, 900, 50);
  text( "$: " + money, 120, 80);
  text( "Lives:" + lives, 100, 110);
  // buttons
  Play.show();
  Build.show();
}

void animateThings() {
  int i = 0;
  while (i < mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    if (myMob.HP <= 0) {
      mobs.remove(i);
      money ++;
    } else {
      i++;
    }
  }

  i=0;
  while (i< towers.size()) {
    Tower myTower = towers.get(i);
    if (mobs.size() > 0)
      myTower.act();
    myTower.show();
    i++;
  }


  i=0;
  while (i< bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.hp <=0) {
      bullets.remove(i);
    } else {
      i++;
    }
  }
  i=0;
  while (i< rings.size()) {
    Ring myRing = rings.get(i);
    myRing.act();
    myRing.show();
    if (myRing.count >= 20) {
      rings.remove(i);
    } else {
      i++;
    }
  }
  i=0;
  while (i< snipes.size()) {
    Snipe mySnipe = snipes.get(i);
    if (mobs.size() > 0) 
      mySnipe.act();
    mySnipe.show();
    if (mySnipe.count >= 10) {
      snipes.remove(i);
    } else {
      i++;
    }
  }
}

void handleButtonClicks() {
  int i =-1;
  int x =0;
  if (mobs.size() < 1) {
    if (Build.clicked) {
      mode = BUILD;
      canBuild = true;
    }
  }
  if (mobs.size() < 1) {
    if (Play.clicked) {
      if (n % 2 ==0) {
        i = 0;
        x = 50;
        while ( i< n/3) {
          mobs.add(new SpeedyMob(x, 400, 1, 0));
          x = x -100;
          i ++;
        }
      }
      if ( n % 1 ==0) {
        i = -1;
        while ( i< n) {
          mobs.add(new Mob(x, 400, 1, 0));
          x = x - 50;
          i++;
        }
      }
      if (n % 3 ==0) {
        i = 0;
        x = 50;
        while ( i< n/3) {
          mobs.add(new ChonkyMob(x, 400, 1, 0));
          x = x -100;
          i ++;
        }
      }
      n ++;
    }
  }
}
