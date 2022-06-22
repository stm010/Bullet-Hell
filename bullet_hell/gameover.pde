void gameover () {
  background (0, 0, 0);

  if (score < 200) {
    text ("GAMEOVER", 100, 100);
  }

  if (score == 200 || score > 200) {
    text ("YOU WIN", 100, 100);
  }
}

void gameoverClicks () {
  mode = INTRO;
  score = 0;
}
