float acceleration;
final float decay = 0.95;
final float size = 100;

float centerX;
float centerY;

float axisX;
float axisY;

Baton baton;
Baton baton2;

void setup() {
  size(500,500);
  
  centerX = width/2;
  centerY = height/2;
  
  baton = new Baton(100, centerX, centerY, 0);
  
  baton2 = new Baton(50, centerX/2, centerY/2, 5);
  
  colorMode(HSB);
}

void draw() {
  blendMode(BLEND);
  fill(0, 10);
  rect(0, 0, width, height);
  baton._speed += acceleration;
  baton._speed *= decay;
  acceleration *= decay;
  
  //background(angle%360,50, 100);
  //background(255);
  
  baton.draw();
  baton2.draw();
}

void keyPressed() {
  if(keyCode == LEFT)
     acceleration -= 0.1; 
   if(keyCode == RIGHT)
     acceleration += 0.1; 
}