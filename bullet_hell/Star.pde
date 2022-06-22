class Star extends GameObject {

  Star () {
    super (random(width), 0, 0, 0, random (1, 5), #FFFFFF, 1);
    vy = size;
    //x = random (0, width);
    //y = 0;
    //vx = 0;
    //size = random (1, 5);
    //vy = size;
    //c = #FFFFFF;
    //lives = 1;
  }

  void act () {
    //x += vx;
    //y += vy;
    super.act();
    if (y > height) lives = 0;
  }

  //void show () {
  //  fill (c);
  //  square (x, y, size);
  //}
}
