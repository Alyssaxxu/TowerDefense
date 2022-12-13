class ChonkyMob extends Mob {

  ChonkyMob( float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 80;
    maxHP = 20 + n;
    HP = maxHP;
    value = 5;
    fillColor = red;
    strokeColor = pink;
    speed = 0.5;
  }
}
