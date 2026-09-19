class Player {
  // Initialise variables for the "Player" which this case, is a spaceship
  float x, y;
  PImage spaceship, spaceshipLeft, spaceshipRight, earth, heart;
  PImage redSpaceship, purpleSpaceship, blueSpaceship, spaceshipRedLeft, spaceshipRedRight, spaceshipPurpleLeft, spaceshipPurpleRight, spaceshipBlueLeft, spaceshipBlueRight;
  boolean isMovingLeft, isMovingRight, gameLost;
  int xspeed, lives, score;

  Player(float startx, float starty) {

    redSpaceship = loadImage("assets/spaceshipRed.png");
    purpleSpaceship = loadImage("assets/spaceshipPurple.png");
    blueSpaceship = loadImage("assets/spaceshipBlue.png");
    spaceshipRedLeft = loadImage("assets/spaceshipRedLeft.png");
    spaceshipRedRight = loadImage("assets/spaceshipRedRight.png");
    spaceshipPurpleLeft = loadImage("assets/spaceshipPurpleLeft.png");
    spaceshipPurpleRight = loadImage("assets/spaceshipPurpleRight.png");
    spaceshipBlueLeft = loadImage("assets/spaceshipBlueLeft.png");
    spaceshipBlueRight = loadImage("assets/spaceshipBlueRight.png");
    earth = loadImage("assets/earth.png");
    heart = loadImage("assets/heart.png");
    x = startx;
    y = starty;
    // red, purple, blue
    lives = 3;
    score = 0;

    xspeed = 5;

    isMovingLeft = false;
    isMovingRight = false;
    gameLost = false;
  }

  void render() {
    textAlign(CENTER,CENTER);
    text("SCORE " + score, 70, 27);
    menu.createBackground();
    imageMode(CENTER);
    image(earth, width/2, 700);
    lives();
    if (isMovingLeft == true) {
      image(spaceshipLeft, x, y);
    } else if (isMovingRight == true) {
      image(spaceshipRight, x, y);
    } else {
      image(spaceship, x, y);
    }
  }


  void move() {
    if (isMovingLeft == true&& x > 50) {
      x = x - xspeed;
    }

    if (isMovingRight == true && x < width-50) {
      x = x + xspeed;
    }
  }

  void spaceshipSelector() {
    if (menu.spaceshipCounter == 1) {
      spaceship = redSpaceship;
      spaceshipLeft = spaceshipRedLeft;
      spaceshipRight = spaceshipRedRight;
    } else if (menu.spaceshipCounter == 2) {
      spaceship = purpleSpaceship;
      spaceshipLeft = spaceshipPurpleLeft;
      spaceshipRight = spaceshipPurpleRight;
    } else if (menu.spaceshipCounter == 3) {
      spaceship = menu.blueSpaceship;
      spaceshipLeft = spaceshipBlueLeft;
      spaceshipRight = spaceshipBlueRight;
    }
  }

  void lives() {
    imageMode(CENTER);
    if (lives == 3) {
      image(heart, 964, 26);
      image(heart, 932, 26);
      image(heart, 900, 26);
    } else if (lives == 2) {
      image(heart, 932, 26);
      image(heart, 900, 26);
    } else if (lives == 1) {
       image(heart, 900, 26);
    } else if (lives == 0) {
      gameLost = true;
    }
  }
}
