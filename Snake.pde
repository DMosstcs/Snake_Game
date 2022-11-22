class Snake {
  int HeadX = 300;
  int HeadY = 300;
  int Size = 50;
  int xSpeed = 0;
  int ySpeed = 0;
  ArrayList <SnakePiece> SnakeBody;
  SnakePiece head;
  public Snake() {
    SnakeBody = new ArrayList<SnakePiece>();
    head = new SnakePiece(HeadX, HeadY, Size);
    SnakeBody.add(head);
  }
  void draw() {
    for (SnakePiece Piece : SnakeBody) {
      Piece.draw();
    }
  }
  public void addSnake() {
    SnakePiece newpiece = new SnakePiece(-Size, -Size, Size);
    SnakeBody.add(newpiece);
  }

  public void move() {

    if (keyPressed == true) {
      if (key == 'w' && ySpeed <= 0) {
        xSpeed = 0;
        ySpeed = -25;
      } else if (key == 's' && ySpeed >= 0) {
        xSpeed = 0;
        ySpeed = 25;
      } else if (key == 'd' && xSpeed >= 0) {
        xSpeed = 25;
        ySpeed =0;
      } else if (key == 'a' && xSpeed <= 0 ) {
        xSpeed = -25;
        ySpeed = 0;
      }
    }
    for (int i =  SnakeBody.size() - 1; i > 0; i--) {
      SnakeBody.get(i).x =  SnakeBody.get(i-1).x;
      SnakeBody.get(i).y =  SnakeBody.get(i-1).y;
    }
    HeadX += xSpeed;
    HeadY += ySpeed;
    head.x =  HeadX;
    head.y = HeadY;
  }
  public boolean checkgameover() {
    for (int i = 1; i < SnakeBody.size(); i++) {
      if (dist(HeadX, HeadY, SnakeBody.get(i).x, SnakeBody.get(i).y) < Size/2) {
        return true;
      }

    }

      if (HeadY - Size/2 < 0 || HeadX + Size/2 > width || HeadY + Size/2 > height || HeadX - Size/2 < 0) {

        return true;
      }

      return false;
    }
    public void reset() {
      HeadX = 300;
      HeadY = 300;
      xSpeed = 0;
      ySpeed = 0;
      SnakeBody = new ArrayList<SnakePiece>();
    head = new SnakePiece(HeadX, HeadY, Size);
    SnakeBody.add(head);
    }
  }
  class SnakePiece {
    int x;
    int y;
    int Size;
    public SnakePiece(int x, int y, int Size) {
      this.x = x;
      this.y = y;
      this.Size = Size;
    }
    public void draw() {
      fill(#39FA0F);
      noStroke();
      rectMode(CENTER);
      rect(x, y, Size, Size);
    }
  }
