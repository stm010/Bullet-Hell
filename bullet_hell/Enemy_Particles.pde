class EnemyParticles extends GameObject {

  EnemyParticles (float x, float y, float vx, float vy) { //allows bullet configuration
    super (x, y, random(vx+5), random(vy+5), 20, orange3, 10);

    // (float x, float y, float vx, float vy, float size, color c, int lives)
  }

  void act () {
    super.act();
    if (timer<0) lives = 0;
  }
}
