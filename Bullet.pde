class Bullet {
  int numBullets = 10;
  float[] xcoord = new float[numBullets];
  float[] ycoord = new float[numBullets];
  boolean[] shot = new boolean[numBullets];
  boolean[] collision = new boolean[numBullets];

  float speed = 7;

  Bullet() {
    for (int i = 0; i < numBullets; i++) {
      shot[i] = false;
      collision[i] = false;
      xcoord[i] = spaceship.x;
      ycoord[i] = spaceship.y;
    }
  }

  void render() {
    for (int i = 0; i < numBullets; i++) {
      if (shot[i] == true) {
        bulletCreate(i);
      }
    }
  }




  void checkCollision() {

    for (int i = 0; i < numBullets; i++) {
      for (int j = 0; j < 5; j++) {
        if (xcoord[i] > rock.xcoord[j] - 50 && xcoord[i] < rock.xcoord[j] +50 && ycoord[i] - 50 <= rock.ycoord[j] + 50 && rock.visible[j] == true) {
          collision[i] = true;
          shot[i] = false;
          rock.visible[j] = false;
          spaceship.score = spaceship.score + 10;
        }
      }
    }
  }


  void move() {
    for (int i=0; i < numBullets; i++) {
      if (shot[i] == true) {
        ycoord[i] = ycoord[i] - 5;
 
      }
    }
  }

  void updateBullet() {
    for (int i = 0; i < numBullets; i++) {
      if (shot[i] == false) {
               xcoord[i] = spaceship.x;
               ycoord[i] = spaceship.y;
      }
    }
  }
  
  void bulletCreate(int num) {
    rectMode(CENTER);
    stroke(#4BFF73);
    fill(255);
    rect(xcoord[num], ycoord[num], 15, 50, 3);
    noStroke();
  }
}
