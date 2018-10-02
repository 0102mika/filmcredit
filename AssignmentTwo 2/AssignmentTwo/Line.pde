
////class for Lines (third animation)
class Line{
  int step1 = 10;
  int x1 = 100;
  int x2 = 100;
  int y1 = 50;
  int y2 = 50;
  int y3 = 10;
  int move = 30;


void display(){
  if(x1 > 200 || x2 < 10){
    move = move*10;
   
  }
  if(x2> 250 || x2 < 10){
    move = move*10;
  }
  x1+=move;
  y1+=move;
  y2-=move;
  x1 -= move;
  
  float xFactor = map(x1, 0, width, 1.0, 8.0);
  float yFactor = map(y1, 0, height, 2.5, 2.0);
  for(int i = 0; i < width; i+=step1){
    //setting for the lines
    stroke(252, 255, 191, random(0,100));
    strokeWeight(3); 
    //how do the line move
    line(i, i*xFactor, width + i*xFactor, height - i*xFactor*yFactor); 
    line(i, i*xFactor, width - i*xFactor, height + i*xFactor*yFactor); 
    line(width+ i, i*xFactor, i*xFactor, height + i*xFactor*yFactor);
    line(width- i, i*xFactor, i*xFactor, height - i*xFactor*yFactor);
  }

}
}