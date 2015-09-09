void setup() {
 size(500,500); 
}

float centerX = 3*width/4;
float centerY = 3*height/4;

float speed = 0;
final float decay = 0.95;
float size = 10;
float angle = 0;
float increment = 0.05;

void draw() {
  background(255);
  angle += speed;
  speed *= decay;
  line(-1*cos(radians(angle))*size+centerX,-1*sin(radians(angle))*size+centerY,
        cos(radians(angle))*size+centerX,sin(radians(angle))*size+centerY);
}

void mouseDragged() {
  speed += increment;
}