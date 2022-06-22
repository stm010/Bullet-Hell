class Bullet2 extends GameObject {

  Bullet2 (float x, float y, float vx, float vy) { //allows bullet configuration
    super (x, y, vx, vy, 50, blue4, 1);
    if (y > height) lives = 0;
  }

  void act () {
    super.act();
    if (offScreen()) lives = 0;
  }
}
