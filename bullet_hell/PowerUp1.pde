class PowerUp1 extends GameObject {

  PowerUp1 (float x, float y, float vx, float vy) { //allows bullet configuration
    super (x, y, 0, 3, 20, blue3, 1);

    // (float x, float y, float vx, float vy, float size, color c, int lives)
  }

  void act () {
    super.act();
    if (offScreen()) lives = 0;
    //if (timer<0) lives = 0;
  }
}
