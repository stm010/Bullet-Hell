void intro () {
  background (0);

  textSize (15);
  text ("BULLET HELL", 100, 100);

  text ("objective: complete final stage and surpass 200 pts", 100, 120);
  text ("purple enemy drops no powerup (health: 1, -1 damage, +1 pts)", 100, 140);
  text ("green enemy drops med (+2) powerup (health: 2, -1 damage, +2 pts)", 100, 155);
  text ("orange enemy drops bullet explosion powerup (health: 100, -10 damage +5 pts)", 100, 170);

  objects = new ArrayList < GameObject > ();
  player1 = new Starfighter();
  objects.add(player1);
}

void introClicks() {
  mode = GAME;
}
