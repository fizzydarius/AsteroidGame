

Player spaceship;
Asteroid rock;
Menu menu;
Bullet bullet;
Scoreboard scorebord;
int count = 0;

boolean gameStarted = false;
void setup() {
  size(1000, 1000);

  spaceship = new Player(width/2, height-100);
  rock = new Asteroid();
  menu = new Menu();
  bullet = new Bullet();
}

void draw() {
  background(0);

  // Checks if the start button is clicked.
  if (menu.startClicked == true) {

    if (menu.beginClicked == true) {


      if (spaceship.gameLost == true) {
        menu.deathMenu();
      } else if (spaceship.gameLost == false) {
        gameStarted = true;
        spaceship.spaceshipSelector();
        startGame();
      }
    } else if (menu.beginClicked == false) {
      menu.playerCustomization();
    }
  } else if (menu.startClicked == false && menu.leaderboardClicked == false) {
    menu.mainMenu();
  } else if (menu.leaderboardClicked == true) {
    menu.leaderboard();
  }

  //spaceship.render();
  //spaceship.move();
  //rock.render();
  //rock.move();




  // you know i have to have this :3
  textSize(20);
  fill(255, 255, 255);
  text("x: "+mouseX+" y: "+mouseY, 60, 15);
}

void startGame() {

  bullet.render();
  bullet.move();
  spaceship.render();
  spaceship.move();
  rock.render();
  rock.move();
  bullet.checkCollision();
  bullet.updateBullet();
}
void keyPressed() {
  if (key == 'a') {
    spaceship.isMovingLeft = true;
  }

  if (key == 'd') {
    spaceship.isMovingRight = true;
  }
  // Code used for the user input, it is able to delete a character when backspace is pressed and has a character limit of 12. It also doesn't allow for CODED buttons to be inputed (when shit is pressed, it doesn't register as the username.
  // ||| BUG/FLMISY:: When the user input is empty, and the user pressed backspace, it records the backspace and adds it as a character to their username. I may be able to fix that with MORE IF STATEMENTS ARRGGHHHH!
  if (menu.userInput.length() <= 12 && gameStarted == false) {
    if (key == BACKSPACE && menu.userInput.length() > 0) {
      menu.userInput = menu.userInput.substring(0, menu.userInput.length() -1);
    } else if (key == CODED) {
      // do nothing ?
    } else if (key == BACKSPACE && menu.userInput.length() == 0) {
      // meow
    } else {
      menu.userInput = menu.userInput + key;
    }
  }

  if (key == ' ' && gameStarted == true && keyPressed) {

    if (count < bullet.numBullets - 1) {
      count = count + 1;
    } else if (count ==  bullet.numBullets - 1) {
      count = 0;
    }
    //println("count" + count);
    bullet.shot[count] = true;
  }
}


void keyReleased() {
  if (key == 'a') {
    spaceship.isMovingLeft = false;
  }

  if (key == 'd') {
    spaceship.isMovingRight = false;
  }
}

void mousePressed() {
  // Checks if some buttons were clicked.
  if (mouseX >= 37.5 && mouseX <= 962.5 && mouseY >= 440 && mouseY <= 560) {
    menu.leaderboardClicked = true;
  }
  if (mouseX >= 300 && mouseX <= 700 && mouseY >= 240 && mouseY <= 360 && menu.leaderboardClicked == false) {
    menu.startClicked = true;
  }
  if (mouseX >= 75+37.5 - 95/2 && mouseX <= 75+37.5 + 95/2 && mouseY >= 650 - 60 && mouseY <= 650 + 60 && menu.beginClicked == false) {
    menu.leftArrowClicked = true;
  }
  if (mouseX >= 850+37.5 - 95/2 && mouseX <= 850+37.5 + 95/2 && mouseY >= 650 - 60 && mouseY <= 650 + 60 && menu.beginClicked == false) {
    menu.rightArrowClicked = true;
  }
  if (mouseX >= 500-185 && mouseX <= 500+185 && mouseY >= 840 && mouseY <= 960 && menu.startClicked == true) {
    menu.beginClicked = true;
  }

  if (mouseX >= 460 && mouseX <= 540 && mouseY >= 787 && mouseY <= 815 && menu.leaderboardClicked == true) {
    menu.leaderboardClicked = false;
  }
  if (spaceship.gameLost == true) {
    if (mouseX >= 275 && mouseX <= 625 && mouseY >= 475 && mouseY <= 525) {
      spaceship = new Player(width/2, height-100);
      rock = new Asteroid();
      menu = new Menu();
      bullet = new Bullet();
      gameStarted = false;
    }
  }
}
