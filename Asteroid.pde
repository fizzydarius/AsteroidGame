class Asteroid {
  float[] xcoord = new float[5];
  float[] ycoord = new float[5];
  boolean[] visible = new boolean[5];
  int time;

  float yspeed;
  // constructor class
  Asteroid() {
    yspeed = 1.5;

    for (int i = 0; i < 5; i++) {
      xcoord[i] = random(10, 990);
      ycoord[i] = random(10, 50);
      visible[i] = true;
    }
  }

  void render() {

    noStroke();
    fill(#A5A3A3);


    for (int i = 0; i < 5; i++) {
      //println(second());
      if (visible[i] == false && millis() > time + 2000) {
        xcoord[i] = random(10, 990);
        ycoord[i] = random(10, 50);
        visible[i] = true;
      } else if (visible[i] == true) {
        create(i);
      }
    }
  }

  void move() {
    for (int i = 0; i < 5; i++) {
      ycoord[i] = ycoord[i] + yspeed;
      if (ycoord[i] > 800 && visible[i] == true) {
        //println("meow");
        visible[i] = false;
        time = millis();
        spaceship.lives = spaceship.lives - 1;
        //println(time, "time");
      }
    }
  }

  void create(int num) {
    if (0 > 1) {
      fill(#A5A3A3);
      stroke(#484848);
      strokeWeight(3);
      beginShape();
      vertex(xcoord[num] - 33, ycoord[num] + 41);
      vertex(xcoord[num] + 22, ycoord[num] + 41);
      vertex(xcoord[num] + 49, ycoord[num] - 39);
      vertex(xcoord[num] + 34, ycoord[num] - 72);
      vertex(xcoord[num] + 9, ycoord[num] - 69);
      vertex(xcoord[num] - 21, ycoord[num] - 40);
      vertex(xcoord[num] - 49, ycoord[num] - 11);
      endShape(CLOSE);
      noStroke();

      fill(#484848);
      circle(xcoord[num] - 10, ycoord[num] + 2, 16);
      circle(xcoord[num], ycoord[num] - 20, 22);
    } else {
      fill(#A5A3A3);
      stroke(#484848);
      strokeWeight(3);
      beginShape();
      vertex(xcoord[num] - 34, ycoord[num] - 33);
      vertex(xcoord[num] + 17, ycoord[num] - 44);
      vertex(xcoord[num] + 48, ycoord[num] - 10);
      vertex(xcoord[num] + 30, ycoord[num] + 42);
      vertex(xcoord[num] - 19, ycoord[num] + 42);
      vertex(xcoord[num] - 47, ycoord[num] + 12);
      endShape(CLOSE);
      
      noStroke();
      fill(#484848);
      circle(xcoord[num] + 3, ycoord[num] - 10, 30);
      circle(xcoord[num] - 5, ycoord[num] + 15, 15);
      
      
    }
  }
}
