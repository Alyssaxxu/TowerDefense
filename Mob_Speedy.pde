class SpeedyMob extends Mob {

  SpeedyMob( float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 40;
    maxHP = 5 + n;
    HP = maxHP;
    value = 5;
    fillColor = white;
    strokeColor = black;
    speed = 5;
  }
}
