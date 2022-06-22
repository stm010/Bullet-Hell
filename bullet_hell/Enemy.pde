class Enemy extends GameObject {

  int cooldown, threshold;

  Enemy() {
    super(random(width), 0, 0, 3, 40, #bdb2ff, 1);

    //enemybullet cooldown
    threshold = 50;
    cooldown = threshold;
  }

  void act() {
    //remove items - reduce lag
    if (offScreen()) lives = 0;

    super.act();
    //managing guns
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;

      //shoot

      //classic
      objects.add (new EnemyBullet (x, y, 0, 10));

      //objects.add (new EnemyBullet (x, y, 0, 10));
      //objects.add (new EnemyBullet (x, y, 10, 0));
      //objects.add (new EnemyBullet (x, y, 0, -10));
      //objects.add (new EnemyBullet (x, y, -10, 10));
    }

    //collisions
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet || obj instanceof Bullet2) { //instanceof checks class
        if (collidingWith (obj)) {
          lives--;
          obj.lives=0; //omit for infinity bullet
          objects.add (new EnemyParticles (x, y, 0, 10));
          objects.add (new EnemyParticles (x, y, 10, 0));
          objects.add (new EnemyParticles (x, y, 0, -10));
          objects.add (new EnemyParticles (x, y, -10, 10));

          if (lives<=0) {
            score = score +1;
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
            score = score +1;
          }
        }
      }
      i++;
    }

    //remove offscreen
    if (offScreen()) lives = 0;
  }
}
