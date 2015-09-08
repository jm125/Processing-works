float acceleration;
final float decay = 0.95;
final float size = 100;

float centerX;
float centerY;

float axisX;
float axisY;

Baton baton;

void setup() {
  size(500,500);
  
  centerX = width/2;
  centerY = height/2;
  
  baton = new Baton(100, centerX, centerY, 0);
  
  colorMode(HSB);
}

void draw() {
  baton._speed += acceleration;
  
  //background(angle%360,50, 100);
  background(255);

  acceleration *= decay;
  
  baton.draw();
}

void keyPressed() {
  if(keyCode == LEFT)
     acceleration -= 0.1; 
   if(keyCode == RIGHT)
     acceleration += 0.1; 
}