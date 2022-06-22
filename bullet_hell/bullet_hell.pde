//imports


//palette

color black = #03071e;

color blue1 = #005f73;
color blue2 = #0a9396;
color blue3 = #94d2bd;
color blue4 = #caf0f8;
color orange1 = #bb3e03;
color orange2 = #ca6702;
color orange3 = #ee9b00;
color yellow = #ffb703;
color red = #e63946;

//framework
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;
int mode = GAME;

int timer;
int timer2;
int score;

boolean up, down, left, right, space;

ArrayList <GameObject> objects;
Starfighter player1;

void setup () {

  size (800, 800);
  mode = INTRO;
  rectMode (CENTER);
  objects = new ArrayList < GameObject > ();
  player1 = new Starfighter();
  objects.add(player1);

  timer = 200;
  timer2 = 0;
  score = 0;
}

void draw () {

  if (mode == INTRO) {
    intro ();
  } else if (mode == GAME) {
    game ();
  } else if (mode == GAMEOVER) {
    gameover ();
  } else if (mode == PAUSE) {
    pause ();
  } else {
    println ("?");
  }
}
