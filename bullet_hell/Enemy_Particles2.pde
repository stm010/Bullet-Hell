class EnemyParticles2 extends GameObject {

  EnemyParticles2 (float x, float y, float vx, float vy) { //allows bullet configuration
    super (x, y, random(vx+7), random(vy+7), 20, orange2, 10);

    // (float x, float y, float vx, float vy, float size, color c, int lives)
  }

  void act () {
    super.act();
    //if (offScreen()) lives = 0;
    if (timer<0) lives = 0;
  }
}
