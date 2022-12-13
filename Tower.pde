//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. 

class Tower {

  final int PLACING = 0;
  final int PLACED = 1;


  float x, y;
  int cooldown, threshold, towerMode, towerType;
  color shade;

  Tower(int type, int _c, int _th) {
    x = mouseX;
    y= mouseY;
    cooldown = _c;
    threshold = _th;
    towerMode = PLACING;
    towerType = type;
    if (towerType == GUN) threshold=30;
    if (towerType ==AOE) threshold = 30;
    if (towerType == SNIPER) threshold = 90;
  }

  void show() {

    stroke(white);
    strokeWeight(4);
    fill(shade);
    if (towerMode == PLACED) {
      if (towerType == GUN) {
        square(x, y, 40);
        shade = dgreen;
      } else if (towerType == AOE) {
        shade = dblue;
        circle(x, y, 40);
      } else if (towerType == SNIPER) {
        shade = red;
        triangle(x, y, x+40, y, x+20, y+40);
      }
    } else if (towerMode == PLACING) {
      if (towerType == GUN) {
        square (mouseX, mouseY, 40);
      } else if (towerType == AOE) {
        circle (mouseX, mouseY, 40);
      } else if (towerType == SNIPER) {
        triangle (mouseX, mouseY, mouseX +40, mouseY, mouseX + 20, mouseY + 40);
      }
      if (mousePressed && mouseX<800 && mouseX>0) {
        towerMode = PLACED;
        x = mouseX;
        y= mouseY;
        towerSelect = SELECT; 
        //canBuild = true ;
      }
    }
  }


  void act() {

    if (towerType == GUN) {
      cooldown++;
      while ( cooldown >= threshold ) {
        cooldown = 0;

        bullets.add(new Bullet(x, y, 0, 10)); //down
        bullets.add(new Bullet(x, y, 0, -10)); //up
        bullets.add(new Bullet(x, y, -10, 0)); // left
        bullets.add(new Bullet(x, y, 10, 0)); // right
      }
    } else if (towerType == AOE) {
      cooldown++;
      while ( cooldown >= threshold ) {
        cooldown = 0;
        rings.add(new Ring(x, y)); //down
      }
    } else if (towerType == SNIPER) {
      cooldown++;
      while ( cooldown >= threshold ) {
        cooldown = 0;
        snipes.add(new Snipe(x, y, 0, 120));
      }
    }
  }
}
