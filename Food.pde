class Food {
int Foodx = 500;
int Foody = 500;
public Food(){
  this.teleport();
}
  void draw() {
    fill(255,0,0);
    ellipse(Foodx, Foody, 15,15);
  
  }
  public boolean checkcollision(int otherX, int otherY, int otherR) {
    float D = dist(Foodx, Foody, otherX, otherY);
    if (D <= 15 + otherR) {

      return true;
    }
    return false;
  }
  public void teleport(){
     float x = random(20, width -20);
    float y = random(20, height-20);
    Foodx = int(x);
    Foody = int(y);
  }
}
