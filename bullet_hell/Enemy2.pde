class Enemy2 extends GameObject {

  int cooldown, threshold;

  Enemy2() {
    super(random (width), 0, 1, 1.5, 30, #caffbf, 2);
    // GameObject (float x, float y, float vx, float vy, float size, color c, int lives) {

    //enemybullet cooldown
    threshold = 100;
    cooldown = threshold;
  }

  void act() {
    //remove items - reduce lag
    //  if (offScreen()) lives = 0;

    super.act();
    //managing guns
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;

      //shoot

      //classic
      //  objects.add (new EnemyBullet (x, y, 0, 10));

      objects.add (new EnemyBullet (x, y, 0, 10));
      objects.add (new EnemyBullet (x, y, 10, 0));
      objects.add (new EnemyBullet (x, y, 0, -10));
      objects.add (new EnemyBullet (x, y, -10, 10));
    }

    //collisions
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) { //instanceof checks class
        if (collidingWith (obj)) {
          lives--;
          obj.lives=0; //omit for infinity bullet
          c = red;

          objects.add (new EnemyParticles (x, y, 0, 10));
          objects.add (new EnemyParticles2 (x, y, 10, 0));
          objects.add (new EnemyParticles (x, y, 0, -10));
          objects.add (new EnemyParticles2 (x, y, -10, 10));

          if (lives<=0) {
            objects.add (new PowerUp2 (x, y, 0, 0.1));
            score = score +2;
          }
        }
      }

      if (obj instanceof Bullet2) { //instanceof checks class
        if (collidingWith (obj)) {
          lives = 0;
          obj.lives=0; //omit for infinity bullet


          objects.add (new EnemyParticles (x, y, 0, 10));
          objects.add (new EnemyParticles2 (x, y, 10, 0));
          objects.add (new EnemyParticles (x, y, 0, -10));
          objects.add (new EnemyParticles2 (x, y, -10, 10));

          if (lives<=0) {
            score = score +2;
          }
        }
      }
      i++;
    }

    //remove offscreen
    //   if (offScreen()) lives = 0;
  }
}
