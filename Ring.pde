class Ring {

  float x, y, vx, vy, d, hp, count;


  Ring(float _x, float _y) {
    y=_y;
    x = _x;
    d = 150;
    count = 0;
  }
  void show() {
    count++;
    if (count <= 20) {
      stroke(255);
      circle(x, y, d);
    } else if (count == 120) {
      count = 0;
    }
  }

  void act() {
  }
}
