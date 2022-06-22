class Starfighter extends GameObject {

  int cooldown, threshold;

  Starfighter() {
    super(width/2, height/2, 0, 0, 40, blue3, 20);
    // (float x, float y, float vx, float vy, float size, color c, int lives)

    cooldown = threshold;

    if (score<150) {
      threshold = 8; //bullet cooldownr
    }

    if (score > 99) {
      threshold = threshold+72; //bullet cooldown
    }
    //x = width/2;
    //y = height/2;
    //vx = 0;
    //vy = 0;
    //size = 40;
    //c = #FF0000;
    //lives = 3;
  }

  void act() {
    super.act();

    textSize (30);
    text (lives, 10, 200);
    text (score, 10, 250);
    textSize (15);

    //color lives indicator
    if (lives > 5) {
      c = blue3;
    }

    if (lives==5) {
      c = blue2;
    }
    if (lives==2) {
      c = blue1;
    }

    //managing guns
    cooldown++;
    if (space && cooldown >= threshold) {


      //objects.add(new Bullet());

      //classic
      objects.add (new Bullet (x, y, 0, -10)); //up

      //objects.add (new Bullet (x, y, 0, 10)); //down
      //objects.add (new Bullet (x, y, 10, 0)); //right
      //objects.add (new Bullet (x, y, -10, 10));

      cooldown = 0;
    }

    //controls
    if (up) vy = -4.2;
    if (down) vy = 4.2;
    if (left) vx = -4.2;
    if (right) vx = 4.2;
    if (!up && !down) vy = vy * 0.9;
    if (!left && !right) vx = vx * 0.9;

    //x += vx;
    //y += vy;
    //collisions
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);

      //bullet damage
      if (obj instanceof EnemyBullet) { //instanceof checks class
        if (collidingWith (obj)) {
          lives--;
          obj.lives=0; //enemy bullet lives

          if (lives<=0) {

            // starfighter particles
            objects.add (new StarfighterParticles (x, y, 0, -2)); //up
            objects.add (new StarfighterParticles (x, y, 0, 2)); //down
            objects.add (new StarfighterParticles (x, y, 2, 0)); //right
            objects.add (new StarfighterParticles (x, y, -2, 2));
            objects.add (new StarfighterParticles (x, y, 0, -15)); //up
            objects.add (new StarfighterParticles (x, y, 0, 15)); //down
            objects.add (new StarfighterParticles (x, y, 15, 0)); //right
            objects.add (new StarfighterParticles (x, y, -15, 15));
            objects.add (new StarfighterParticles (x, y, 0, -5 )); //up
            objects.add (new StarfighterParticles (x, y, 0, 5)); //down
            objects.add (new StarfighterParticles (x, y, 5, 0)); //right
            objects.add (new StarfighterParticles (x, y, -5, 0));
            objects.add (new StarfighterParticles (x, y, -5, 5));

            timer = 730;
            if (timer == 0) {

              mode = GAMEOVER;
            }
          }
        }
      }

      if (obj instanceof EnemyBullet2) { //instanceof checks class
        if (collidingWith (obj)) {
          lives = lives - 10;
          obj.lives=0; //powerup lives

          if (lives<=0) {
            // starfighter particles
            objects.add (new StarfighterParticles (x, y, 0, -2)); //up
            objects.add (new StarfighterParticles (x, y, 0, 2)); //down
            objects.add (new StarfighterParticles (x, y, 2, 0)); //right
            objects.add (new StarfighterParticles (x, y, -2, 2));
            objects.add (new StarfighterParticles (x, y, 0, -15)); //up
            objects.add (new StarfighterParticles (x, y, 0, 15)); //down
            objects.add (new StarfighterParticles (x, y, 15, 0)); //right
            objects.add (new StarfighterParticles (x, y, -15, 15));
            objects.add (new StarfighterParticles (x, y, 0, -5 )); //up
            objects.add (new StarfighterParticles (x, y, 0, 5)); //down
            objects.add (new StarfighterParticles (x, y, 5, 0)); //right
            objects.add (new StarfighterParticles (x, y, -5, 0));
            objects.add (new StarfighterParticles (x, y, -5, 5));

            timer = 730;
            if (timer <= 0) {

              mode = GAMEOVER;
            }
          }
        }
      }

      //bullet powerup
      if (obj instanceof PowerUp1) { //instanceof checks class
        if (collidingWith (obj)) {
          //lives = lives + 20;
          obj.lives=0; //powerup lives

          //powerup boost
          objects.add (new Bullet2 (x, y, 0, -10)); //up
          objects.add (new Bullet2 (x, y, 0, 10)); //down
          objects.add (new Bullet2 (x, y, 10, 0)); //right
          objects.add (new Bullet2 (x, y, -10, 10));
          objects.add (new Bullet2 (x, y, 1, -5)); //up
          objects.add (new Bullet2 (x, y, 1, 5)); //down
          objects.add (new Bullet2 (x, y, 5, 1)); //right
          objects.add (new Bullet2 (x, y, -5, 5));
          objects.add (new Bullet2 (x, y, 0, -15)); //up
          objects.add (new Bullet2 (x, y, 2, 15)); //down
          objects.add (new Bullet2 (x, y, 15, 0)); //right
          objects.add (new Bullet2 (x, y, -15, 15));
          objects.add (new Bullet2 (x, y, 0, -1)); //up
          objects.add (new Bullet2 (x, y, 4, 1)); //down
          objects.add (new Bullet2 (x, y, 1, 4)); //right
          objects.add (new Bullet2 (x, y, -1, 1));
        }
      }

      //med powerup
      if (obj instanceof PowerUp2) { //instanceof checks class
        if (collidingWith (obj)) {
          lives = lives + 2;
          obj.lives=0; //powerup lives

          //timer2 = 200;
          //timer2 --;
          //threshold = 0;
          //if (timer2 < 0) {
          //  threshold = 8;
          //  timer2 = 200;

          //}
        }
      }

      i++;
    }





    //offscreen tp
    if (x > width) {
      x = 0 + 1;
    }
    if (x < 0) {
      x = width + 1;
    }
    if (y > height) {
      y = 0 + 1;
    }
    if (y < 0) {
      y = height - 1;
    }
  }

  //void show () {
  //  fill (c);
  //  square (x, y, size);
  //}
}
