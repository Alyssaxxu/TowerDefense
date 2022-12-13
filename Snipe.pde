class Snipe {

  float x, y, hp, j, count, cooldown, threshold;


  Snipe(float _x, float _y, int c, int th) {
    y=_y;
    x = _x;
    count = 0;
    j = 1;
    cooldown = c;
    threshold = th;
  }
  void show() {
    stroke(white); 
    int i = 0;
    j = j +0.5;
    strokeWeight(j);
    if (count<=10 && j <= 10) {
      if (mobs.size() > 0) {
        line( x+ 20, y+ 20, mobs.get(0).x, mobs.get(0).y);
      }
    } else if (count == 80) {
      count = 0;
      j = 0;
    }
  }

  void act() {
  }
}
