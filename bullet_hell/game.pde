void game () {

  if (timer==600) {
    mode = GAMEOVER;
  }

  //gamemode indication
  textSize (45);
  if (score < 50) {
    text ("stage 1", 330, 100);
  }

  if (score > 49 && score < 100) {
    text ("stage 2", 330, 100);
  }

  if (score > 99 && score < 201) {
    text ("FINAL STAGE", 330, 100);
  }

  if (score > 199) {
    mode = GAMEOVER;
  }

  textSize (15);

  //star streaks
  fill (10, 90); //transparency
  rect (width/2, height/2, width, height);
  addObjects();
  gameEngine();
  debug ();


  //clears explosions
  text (timer, 10, 60);
  timer = timer - 1;
  if (timer<-1) {
    timer = 200;
  }

  text (timer2, 10, 80);
  timer2 --;
}



void addObjects() {
  objects.add(0, new Star ());

  if (score < 49) {
    if (frameCount % 30 == 0) objects.add(new Enemy());
    if (frameCount % 60 == 0) objects.add(new Enemy2());
  }

  if (score > 49) {
    if (frameCount % 30 == 0) objects.add(new Enemy());
    if (frameCount % 60 == 0) objects.add(new Enemy2());
    if (frameCount % 1000 == 0) objects.add(new Enemy3());
  }

  if (score > 100) {
    if (frameCount % 15 == 0) objects.add(new Enemy());
    if (frameCount % 70 == 0) objects.add(new Enemy2());
    if (frameCount % 800 == 0) objects.add(new Enemy3());
  }
}

void debug () {
  text (frameRate, 10, 20);
  text (objects.size(), 10, 40);
}


void gameEngine() {
  int i = 0;
  while ( i < objects.size()) {
    GameObject s = objects.get(i);
    s.act();
    s.show();
    if (s.lives == 0) {
      objects.remove(i);
    } else {
      i ++;
    }
  }
}

void gameClicks() {
  mode = PAUSE;
}
