class EnemyBullet2 extends GameObject {

  EnemyBullet2 (float x, float y, float vx, float vy) {
    super (x, y, vx, vy, 30, red, 1);
    if (y > height) lives = 0;
  }
  void act () {
    super.act();
    if (offScreen()) lives = 0;
  }
}
