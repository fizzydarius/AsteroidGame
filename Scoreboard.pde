class Scoreboard {

  PrintWriter output;

  int[] scores = new int[3];
  int j = 3;
  int score = spaceship.score;
  String user = menu.userInput;
  String[] lines = loadStrings("assets/data.txt");
  boolean changed = false;
  String s;
  Scoreboard() {
    output = createWriter("assets/data.txt");

    for (int i=0; i < (lines.length); i++) {

      if (i < 3 && changed == false) {
        scores[i] = Integer.valueOf(lines[i+3]);
        if (scores[i] < score) {
          s = Integer.toString(score);
          lines[i+3] = s;
          lines[i] = user;
          changed = true;
          println("CHANGED MEOW");
        }
      }
      println(lines[i]);

      output.println(lines[i]);
    }

    output.close();
  }
}
