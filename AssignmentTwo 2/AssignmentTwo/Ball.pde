
//class for Balls (first animation)
class Ball {
  float x;  
  float y;
  float speed;
  float gravity =0.8;
  color c;

  Ball (){
    //temporary variables
    x = random(width);
    y = random(height);
    speed = random(10,100);
    c = color(random(205,255), 255, 255, random(200,255));
  }

  void fall() {
    y-= speed; 
    speed -= gravity;
  }

  void bounce() {
    if ( y > width) {
      speed  = speed*-0.56;
      y = width;
    }
  }
  
  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, speed, speed);
  }
}