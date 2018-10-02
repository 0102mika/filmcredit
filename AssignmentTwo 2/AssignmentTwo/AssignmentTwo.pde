/* 
 PROJECT: Assignemnt Two
 Mika Hirata   3154546
 Title "SOMEWHERE"  
 
 Mitchell Chan 
 
 You can either wait till the scene changes or click the mouse to cycle through the animations.
 */
 
 /* Movie = "Somewhere" by Sofia Coppola
 In the movie called "Somewhere", Coppola used pastel colors to illustrate the story of young girl and her father.
 The first animation of my film title credit illustrates the scene when the main girl and her father are playing at the
 pool. 
 */
 

PFont f0; //font name

import processing.sound.*; //import the liberary for the sound
SoundFile soundFile; // name for my sound file

int sceneCounter=0; // setting a counter to switch the scenes
Timer t1;  //declaring the class method "Timer" in the main sketch

Ball[] balls = new Ball[1000]; //created 1000 allays for te class "Ball"
Line lines; //declaring the class method "Lines" in the main sketch

float x;
float y;
float y2;

float speed1 = 2.5; //speed of the moving font  "S O M E W H E R E" (first animation)
float speed2 = 1.0; //speed of the moving font  "Elle Fanning" (third animation)
float speed3 = 1.0; //speed of the moving font  "Stephen Dorff" (fourth animation)

float radius = 300; // set radius as 300 for the green sphere (second animation)
float ellipse_size =0.0;  // size of yellow ellipse at the end of the film credit (seventh animation)

void setup() {
  size(1200, 700, P3D); //size of the canvas
  //made the canvas into three dementional space by suing P3D for my sphere animation
  
  soundFile = new SoundFile(this, "01 sound.mp3");
  soundFile.play(); 
  
  f0 = loadFont("Avenir-HeavyOblique-48.vlw"); 
  t1 = new Timer(5500); //set up timer with 5.5 sec interval
  
  lines = new Line();//set up line class (third animation)

//create an array for balls (first scene)
  for (int i=0; i < balls.length; i++) {   
    balls[i] =new Ball();
  }
}

void draw() {
  checkTime(); //time checker
  if (sceneCounter == 0 || sceneCounter == 1  ) { //11 sec
    one(); //first animation 
  } else if (sceneCounter == 2 ||sceneCounter == 3){ //11 sec
    two(); //second animation
  } else if (sceneCounter==4 ||sceneCounter == 5) { //11 sec
    three(); //third animation
  } else if (sceneCounter ==6 ||sceneCounter == 7) { //11 sec
    four(); //fourth animation
  } else if (sceneCounter ==8) {//5.5 sec
    five(); //fifth animation
  } else if (sceneCounter ==9) {//5.5 sec
    six();  //sixth animation
  } else if (sceneCounter== 10) {//5.5 sec
    seven(); //seventh animation
  } else if (sceneCounter >= 11) {//5.5 sec
    eight(); //last animation
  }
}

void one() {
  //first animation
  background(53, 219, 240);
  textFont(f0, 60);
  fill(random(0, 200));
  text("S O M E W H E R E", 340, y);
  y+=speed1;
  if (y== 380) {
    speed1 = 0; //move the texts to 380 height
  }
  
  //call the Ball function from a class

  for (int i= 0; i< balls.length; i++) {
    balls[i].fall();
    balls[i].bounce();
    balls[i].display();
  }
}

void two() {
  //second animation
  fill(255);
  background(46, 191, 156);

  textSize(random(60, 62)); //change the size of the text between 60~62
  text("Sofia Coppola", 390, 390);

  translate(width/2, height/2); //translate  x and y into the center of the canvas
  rotateX(frameCount*0.01);  // rotate the sphere around x-axis
  rotateZ(frameCount*0.01);  // rotate the sphere around y-axis

  for (int i = 0; i <= 180; i += 1) {
    float radianS = radians(i);
    float z = radius * cos(radianS); //declaring z value
    for (int t = 0; t < 360; t += 5) {
      float radianT = radians(t);
      float x = radius * sin(radianS) * cos(radianT); // declaring x value
      float y = radius * sin(radianS) * sin(radianT); // declaring y value

      stroke(255, 255, 255, random(40, 100)); //stroke color: white
      strokeWeight(10); //thickness of the circles
      point(x, y, z);
    }
  }
  
  //this code is inspired from 
 // https://www.openprocessing.org/sketch/218641
 // http://p5aholic.hatenablog.com/entry/2015/06/15/194250
  
}

void three() {
  //third animation
  fill(255);
  background(255, 152, 152);
  lines.display(); //class Line
  
  fill(random(200, 255));
  text("Elle Fanning", x, 380);
  x+=speed2;
  if (x== 410) {
    speed2 = 0; //stop moving the font when it hits 410
  }
}

void four() {
  //fourth animation
  background(222, 107, 111);
  fill(random(0, 225), random(0, 225), random(0, 225), random(100, 150));
  noStroke();
  rectMode(CENTER);
  frameRate(100);
  noiseDetail(1, 1.0);
 //create ellipse in the background
  for (int x = 1; x < width; x += 10) {
    for (int y = 1; y < height; y += 10) {
      float n = noise(x * 0.01, y * 0.01, frameCount * 0.01);
      pushMatrix(); //start matrix
      translate(x, y);
      rotate(TWO_PI * n);
      scale(7 * n);
      ellipse(0, 0, 3, 3);
      popMatrix(); //finish matrix
    }
  }
  fill(255);
  //  f4 = loadFont("Avenir-HeavyOblique-48.vlw");
  textSize(random(60, 62));
  text("Stephen Dorff", 390, y2);
  
  y2+=speed3;
  if (y2== 380) {
    speed3 = 0; //stop moving the text when it hits 380
  }
  //this code is inspired by  https://www.openprocessing.org/sketch/153224
}

void five() {
  //fifth animation
  background(147, 255, 222);
  fill(random(255));
  textSize(random(60, 63)); 
  text(int(random(10)), random(width), random(height));
  text("Michelle Monaghan", 320, 390);
}

void six() {
  //sixth animation
  background(147, 255, 222);
  fill(0);
  textSize(50);
  text("Produced by Pathé Distribution", 230, 390);
}

void seven() {
  //seventh animation
  //create an ellipse which is a transition between scene 6 and scene 8
  
  fill(247,255,147);
  ellipse(width/2, height/2, ellipse_size, ellipse_size);
  ellipse_size = ellipse_size + 4.0; //the size of the ellpise increases by 4.0
}

void eight() {
  //eighth animation
  //my name and student number
  background(247, 255, 147);
  fill(0);
  textFont(f0, 30);
  text("Film Credit by Mika Hirata 3154546", 350, 400);
  text("Thank you for watching! ", 420, 300);
  noFill();
  stroke(0);
  strokeWeight(4);
  rect(600, 350, 600, 300);
}

void checkTime() {
  if (t1.isFinished()) {
    sceneCounter = sceneCounter+1; //when the timer hits 5.5 sec the sceneCounter will increase by 1
    t1.start(); //start the timer again
  }
}

void mousePressed() {
  sceneCounter++; //when the mouse is pressed the sceneCounter will increase by 1
  //if the mouse if pressed, sceneCounter will be increated by one and pass it to next scene
}

/* Other references
 https://processing.org/reference/millis_.html
 https://py.processing.org/tutorials/p3d/
 */
 //Thank you for your time! Mika Hirata 