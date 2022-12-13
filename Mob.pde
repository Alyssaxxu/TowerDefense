//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

//(0, 400, 1, )
class Mob {

  float x, y, vx, vy, d;
  float HP, maxHP;
  color fillColor, strokeColor;
  float speed, value;

  Mob(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y =_y;
    vx = _vx;
    vy = _vy;
    d= 40;
    HP = 10;
    maxHP = 10;
    fillColor = blue;
    speed = 2;
  }

  void show() {
    stroke(fillColor);
    fill(fillColor);
    strokeWeight(3);
    circle(x, y, d);
    healthbar();
  }

  void act() {
    x = x + vx*speed;
    y = y+ vy*speed;

    int i =0;
    while (i< bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        HP = HP - 1 ;
        myBullet.hp = myBullet.hp - 1;
      }
      i ++;
    }
    i=0;
    while (i< rings.size()) {
      Ring myRing= rings.get(i);
      if (dist(myRing.x, myRing.y, x, y) < d/2 + myRing.d/2) {
        HP = HP - 1 ;
      }
      i ++;
    }
    i=0;
    while (i< snipes.size()) {
      Snipe mySnipe= snipes.get(i);
      if (mobs.size() > 0) {
        if (mySnipe.j ==9) {
          mobs.get(0).HP = mobs.get(0).HP -5;
          mySnipe.j = 0;
        }
      }
      i ++;
    }
    // mob direction
    i = 0;
    while ( i< nodes.length) {
      if ( dist(nodes[i].x, nodes[i].y, x, y) < 4) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    } // check if reached end
    i = 0;
    if ( x > 800) {
      mobs.remove(i);
      lives = lives - 1;
    } else {
      i++;
    }
  }

  void healthbar() {
    rectMode (CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+10)-2, 54, 24);
    fill(purple);
    rect(x-25, y-(d+10), 50, 20);
    fill(blue);
    rect(x-25, y-(d+10), HP*50/maxHP, 20);
    rectMode(CENTER);
  }
}
