class Enemy3 extends GameObject {

  int cooldown, threshold;

  Enemy3() {
    super(random(width), 0, 0, 0.6, 60, #ffba08, 100);

    //enemybullet cooldown
    threshold = 300;
    cooldown = threshold;
  }

  void act() {

    //color lives indicator
    if (lives==90) {
      c = #faa307;
    }
    if (lives==80) {
      c = #f48c06;
    }
    if (lives==70) {
      c = #f48c06;
    }
    if (lives==60) {
      c = #e85d04;
    }
    if (lives==50) {
      c = #dc2f02;
    }
    if (lives==40) {
      c = #d00000;
    }
    if (lives==30) {
      c = #9d0208;
    }
    if (lives==20) {
      c = #6a040f;
    }
    if (lives==10) {
      c = #370617;
    }


    //remove items - reduce lag
    if (offScreen()) lives = 0;

    super.act();
    //managing guns
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;

      //shoot

      //classic
      objects.add (new EnemyBullet2 (x, y, 0, 10));

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



          if (lives<=0) {
            objects.add (new EnemyParticles (x, y, 0, 5));
            objects.add (new EnemyParticles (x, y, 5, 0));
            objects.add (new EnemyParticles (x, y, 0, -5));
            objects.add (new EnemyParticles (x, y, -5, 10));
            objects.add (new EnemyParticles (x, y, 0, 10));
            objects.add (new EnemyParticles2 (x, y, 10, 0));
            objects.add (new EnemyParticles (x, y, 0, -10));
            objects.add (new EnemyParticles2 (x, y, -10, 10));
            objects.add (new PowerUp1 (x, y, 0, 0.4));


            score = score +5;
          }
        }
        if (obj instanceof Bullet2) { //instanceof checks class
          if (collidingWith (obj)) {
            lives = 0;
            obj.lives=0; //omit for infinity bullet


            objects.add (new EnemyParticles (x, y, 0, 5));
            objects.add (new EnemyParticles (x, y, 5, 0));
            objects.add (new EnemyParticles (x, y, 0, -5));
            objects.add (new EnemyParticles (x, y, -5, 10));
            objects.add (new EnemyParticles (x, y, 0, 10));
            objects.add (new EnemyParticles2 (x, y, 10, 0));
            objects.add (new EnemyParticles (x, y, 0, -10));
            objects.add (new EnemyParticles2 (x, y, -10, 10));
            objects.add (new PowerUp1 (x, y, 0, 0.4));

            if (lives<=0) {
              score = score +5;
            }
          }
        }
      }
      i++;
    }

    //remove offscreen
    if (offScreen()) lives = 0;
  }
}
