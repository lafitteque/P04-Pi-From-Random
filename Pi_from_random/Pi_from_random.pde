// This program estimates PI with random values. The calculation is made by counting random points that fall in a square and the circle inside the square 
// (with the diameter equal to the width of the square)
// squareArea = width * width
// circleArea = PI * (width / 2) ^2
// Probability of beeing inside the circle = circleArea / circleArea = PI / 4
// So we can estimate PI calculating 4 * number_of_points_in_circle / total_number_of_points

int totalCount=0;
int countInCicle =0;

int screenWidth = 1000;

int squareArea;


void setup(){
  size(1000,1000);
  background(20);
  
  // Draws the cicle and square
  noFill();
  strokeWeight(4);
  stroke(0,0,255);
  ellipse(screenWidth/2,screenWidth/2,screenWidth,screenWidth);
  
  noFill();
  strokeWeight(4);
  stroke(255,0,0);
  rect(0,0,screenWidth,screenWidth);
  
  squareArea = screenWidth*screenWidth/4;
  
}

void draw(){
  addPoints(50);
  
  print("\n");
  print((double)countInCicle/totalCount*4);
  
}


void addPoints(int n) {
  for (int i = 0; i<n ; i++){
    // we count each point
    totalCount ++;
    
    // we set random positions for all points
    int x = (int) (Math.random()*screenWidth-screenWidth/2) ;
    int y = (int) (Math.random()*screenWidth -screenWidth/2) ;

    // We draw each one depending on where they are
    if (x*x +y*y < squareArea){
      // we count each point in the circle
      countInCicle ++;
      push();
      stroke(255,0,0);
      point(screenWidth/2 + x ,screenWidth/2 + y);
      pop();  
    }
    else{
      push();
      strokeWeight(4);
      stroke(255);
      point(screenWidth/2 + x ,screenWidth/2 + y);
      pop();
    }
  }
  
}
