import java.io.File;
import java.io.IOException;
import java.io.FileWriter;
import java.util.Scanner;
import java.util.Collections;
File HighScoreFile;
String textString = "";
Food apple;
Snake snake;
int score = 0;
ArrayList<HS> HighScores;

boolean textInput = false;
void setup() {
  size(1000, 1000);
  HighScores = new ArrayList<HS>();
  try {
    HighScoreFile = new File("HSF.txt");
    if (HighScoreFile.createNewFile()) {

      print("Create New File");
    } else {
      print("file exsists");
    }
    Scanner R = new Scanner(HighScoreFile);
    while (R.hasNextLine()) {
      String[] Next = R.nextLine().split(",");
      HS hs = new HS(Next[1], Integer.parseInt(Next[0]));
      if (HighScores.size() < 5) {
        HighScores.add (hs);
      } else {
        Collections.sort(HighScores);
        if (hs.compareTo( HighScores.get(0))>= 0) {
          HighScores.set(0, hs);
        }
        Collections.sort(HighScores, Collections.reverseOrder());
      }
    }

    R.close();
  }
  catch(IOException e) {
    System.out.println("error");
    e.printStackTrace();
  }

  apple = new Food();
  snake =new Snake();
}

void draw() {
  background(#ADABAB);
  fill(0, 0, 0);
  textSize(100);
  textAlign(CENTER, CENTER);
  text(score, 500, 100);
  apple.draw();
  snake.draw();
  if (frameCount%5==0 && textInput == false) {
    snake.move();
  }
  if (snake.checkgameover() == true) {
    fill(0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Enter Initials", 500, 300);
    text(textString, 500, 500);
    textInput = true;
  }
  if (apple.checkcollision(snake.HeadX, snake.HeadY, snake.Size/2)) {
    apple.teleport();
    score  += 1;
    print(score);
    snake.addSnake();
  }
}
void keyPressed() {
  if (textInput == true) {
    if (key !=CODED) {
      String aloud ="abcdefghijklmnopqrstuvwxyz";
      String keyString = "" + key;
      if (aloud.contains(keyString.toLowerCase()))
        textString += keyString;
      else if (key == BACKSPACE)
        textString = textString.substring(0, textString.length()-1);

      else if ( key == ENTER || key == RETURN) {
        textInput =false;
        HS hs = new HS (textString, score);
        
         Collections.sort(HighScores);
        if (hs.compareTo( HighScores.get(0))>= 0) {
          HighScores.set(0, hs);
        }
        Collections.sort(HighScores, Collections.reverseOrder());
        try {
          FileWriter w = new FileWriter("HSF.txt");
          w.write(score + ","  + textString);
          w.close();
        }
        catch(IOException e) {
          System.out.println("error");
          e.printStackTrace();
        }
        textString = "";
        snake.reset();
        apple.teleport();
        score =0;
      }
    }
  }
}
