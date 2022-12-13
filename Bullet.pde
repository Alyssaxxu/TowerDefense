//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {

  float x, y, vx, vy, d, hp;


  Bullet(float _x, float _y, float _vx, float _vy) {
    x=_x;
    y=_y;
    vx= _vx;
    vy = _vy;
    d = 15;
    hp = 1;
  }
  void show() {
    stroke(green);
    strokeWeight(2);
    fill(green);
    circle(x, y, d);
  }

  void act() {

    x = x +vx;
    y = y+ vy;

    int i = 0;
    if (x > width && x < 0 && y > height && y < 0) {
      hp = hp -1;
    }
  }
}
