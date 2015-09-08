float angle;
float speed;
float acceleration;
final float decay = 0.95;
final float size = 100;

float centerX;
float centerY;

float axisX;
float axisY;

void setup() {
  size(500,500);
  
  centerX = width/2;
  centerY = height/2;
  
  colorMode(HSB);
}

void draw() {
  speed += acceleration;
  angle += speed;
  
  //background(angle%360,50, 100);
  background(255);
  
  speed *= decay;
  acceleration *= decay;
  
  axisX = centerX + 1.5*size*cos(radians(angle/2));
  axisY = centerY + 1.5*size*sin(radians(angle/2));
  
  float x1 = axisX - size*cos(radians(angle));
  float x2 = axisX + size*cos(radians(angle));
  float y1 = axisY - size*sin(radians(angle));
  float y2 = axisY + size*sin(radians(angle));
  
  line(x1,y1,x2,y2);
  ellipse(x1,y1,20,20);
  ellipse(x2,y2,20,20);
}

void keyPressed() {
  if(keyCode == LEFT)
     acceleration -= 0.1; 
   if(keyCode == RIGHT)
     acceleration += 0.1; 
}