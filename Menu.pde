Scoreboard leaderboard;
class Menu {
  // Initializing of variables

  // Images used in the menu
  PImage earth, logo, redSpaceship, purpleSpaceship, blueSpaceship, spaceshipRedLeft, spaceshipRedRight, spaceshipPurpleLeft, spaceshipPurpleRight, spaceshipBlueLeft, spaceshipBlueRight, earthSad;

  // the font that needs to be loaded
  PFont font;

  // boolean variables used
  boolean startHover, leaderboardHover, startClicked, rightArrowClicked, leftArrowClicked, beginClicked, leaderboardClicked, leaderboardUpdate, firstTime;

  // the user input
  String userInput;

  // coordinates to create the star background
  float[] xcoord = new float[100];
  float[] ycoord = new float[100];

  // variable used to determine which spaceship the user uses, controlled by clicked the arrow
  // ||| BUG/FLMISY:: Due to both time limitations and resource availability, I was not able to use fully create the triangle border to check if the mouse was pressed , ask adam for help on how to word it :)
  int spaceshipCounter;

  // Scoreboard stuff

  String[] lines = loadStrings("assets/data.txt");
  // Constructor class
  Menu() {

    // Determine the values of the variables

    logo = loadImage("assets/asteroid.png");
    earth = loadImage("assets/earth.png");
    redSpaceship = loadImage("assets/spaceshipRed.png");
    purpleSpaceship = loadImage("assets/spaceshipPurple.png");
    blueSpaceship = loadImage("assets/spaceshipBlue.png");
    earthSad = loadImage("../main/assets/earthSad.png");


    font = createFont("Microsoft PhagsPa Bold", 100);

    for (int i = 0; i < 100; i++) {
      xcoord[i] = random(10, 990);
      ycoord[i] = random(10, 990);
    }


    startHover = false;
    leaderboardHover = false;
    startClicked = false;
    leftArrowClicked = false;
    rightArrowClicked = false;
    beginClicked = false;
    leaderboardUpdate = false;
    firstTime = true;

    userInput = "";

    spaceshipCounter = 1;
  }

  // The main menu, that the user is presnted with upon the start of the program
  void mainMenu() {

    createBackground();

    // Checks to see if buttons are hovered, making the buttons darker
    if (startHover == true) {
      fill(0, 255, 0);
    } else {
      fill(0, 200, 0);
    }

    // Start button box
    rect(width/2, height/2-200, 420, 120, 5);
    rect(width/2, height/2, 925, 120, 5);

    // Text on the main menu
    textFont(font, 128);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    fill(255, 255, 255);
    text("START", width/2, height/2-200);
    text("LEADERBOARD", width/2, height/2);

    // Loaded images upp for the background
    imageMode(CENTER);
    image(logo, width/2, height-900);
    image(earth, width/2, height-500);
  }

  // Creates the star background
  void createBackground() {
    for (int i = 0; i < 100; i++) {
      fill(255, 255, 255);
      circle(xcoord[i], ycoord[i], 2);
    }
  }

  // Method that checks the hovering of buttons
  void checkHover() {
    if (mouseX >= 300 && mouseX <= 700 && mouseY >= 240 && mouseY <= 360) {
      startHover = true;
    } else {
      startHover = false;
    }
  }

  // The menu that the user is promted up with upon clicking the START button, this allows the user to enter their username and to pick their spaceship

  void playerCustomization() {

    createBackground();

    // Text on the screen, alongside the user input box.
    noStroke();
    textSize(120);
    text("Hello, Captain!", width/2, height-900);
    textSize(20);
    text("Before we get started we need to get your name and your preferred spaceship!", width/2, height - 800);
    fill(#9B9B9B);
    rect(width/2, height - 700, 400, 100, 5);
    fill(#171717);
    rect(width/2, height - 700, 390, 90);

    // Prompts the user to input text, tried adding a flashing/blinking rectangle, didn't work (I could add a | at the end and every time the user inputs something, it deletes the last character and then adds it again.
    // Perhaps at a lower frame rate that will look like a flashing rectangle.
    if (userInput.length() == 0) {
      fill(240);
      textSize(20);
      text("[username here]", width/2, height -700);
    }
    // The user input
    fill(255);
    textSize(40);
    text(userInput, width/2, height - 700);

    // Prompts the user to select a spaceship.
    textSize(80);
    text("Choose your spaceship!", width/2, height - 550);
    fill(255);
    rect(75+37.5, 650, 95, 120,2);
    rect(850+37.5, 650, 95, 120,2);
    fill(0);

    // The triangles used to choose the spaceship.
    triangle(75, 650, 150, 700, 150, 600);
    triangle(925, 650, 850, 700, 850, 600);


    // Uses the image of the spaceship in according to the counter.
    if (spaceshipCounter == 1) {
      image(redSpaceship, width/2, 650);
    } else if (spaceshipCounter == 2) {
      image(purpleSpaceship, width/2, 650);
    } else if (spaceshipCounter == 3) {
      image(blueSpaceship, width/2, 650);
    }


    // The following code block increments/decreases the spaceshipCounter by 1 each time the corresponding button is clicked. When spaceshipCounter = 1 and the left button is clicked, it goes to 3,
    //and when it is = 3 and the right button is clicked it goes to 1.
    if (rightArrowClicked == true && spaceshipCounter == 3) {
      spaceshipCounter = 1;
      rightArrowClicked = false;
    } else if (rightArrowClicked == true && spaceshipCounter != 3) {
      spaceshipCounter++;
      rightArrowClicked = false;
    }

    if (leftArrowClicked == true && spaceshipCounter == 1) {
      spaceshipCounter = 3;
      leftArrowClicked = false;
    } else if (leftArrowClicked == true && spaceshipCounter != 1) {
      spaceshipCounter--;
      leftArrowClicked = false;
    }

    fill(255, 0, 0);
    rect(width/2, 900, 370, 120, 5);
    textSize(120);
    fill(255);
    text("BEGIN", width/2, 900);
    //println(spaceshipCounter); // error checking
  }

  void deathMenu() {

    if (firstTime == true) {
      leaderboard = new Scoreboard();
      firstTime = false;
    }
    background(0);
    createBackground();
    strokeWeight(0);
    fill(255);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textSize(40);
    text("YOU LET US DOWN, Capt. " + userInput, width/2, 200);
    textSize(30);
    text("Final Score", width/2, 300);
    textSize(26);
    text(spaceship.score, width/2, 325);
    fill(#FF5D27);
    rect(width/2, 500, 250, 50, 4);
    fill(255);
    textSize(40);
    text("Start again", width/2, 500);
    imageMode(CENTER);
    image(earthSad, width/2, 500);
  }

  void leaderboard() {
    float j = 400;
    createBackground();
    textSize(40);
    text("LEADERBOARD", width/2, 300);
    for (int i = 0; i < 3; i++) {
      text(lines[i] +" " + lines[i+3], width/2, j);
      j = j + 100;
    }

    stroke(255);
    strokeWeight(2);
    fill(0, 0, 0, 0);
    rect(500, 450, 500, 500, 5);
    noStroke();

    fill(255);
    text ("EXIT", width/2, 800);
  }
}
