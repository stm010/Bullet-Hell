class PowerUp2 extends GameObject {

  PowerUp2 (float x, float y, float vx, float vy) { //allows bullet configuration
    super (x, y, 0, 1, 20, 255, 1);

    // (float x, float y, float vx, float vy, float size, color c, int lives)
  }

  void act () {
    super.act();
    if (offScreen()) lives = 0;
  }
}
