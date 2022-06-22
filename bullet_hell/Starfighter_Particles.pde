class StarfighterParticles extends GameObject {

  StarfighterParticles (float x, float y, float vx, float vy) { //allows bullet configuration
    super (x, y, random(vx-5), random(vy-5), 50, blue1, 10);
  }

  void act () {
    super.act();
    if (offScreen()) lives = 0;
  }
}
