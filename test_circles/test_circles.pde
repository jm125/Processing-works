size(800,800);
smooth();
translate(width/2,height/2);
strokeWeight(2);
beginShape();
for(int i=0;i<350;i++)
{
  curveVertex((i*2)*sin(i/5.0),(i*2)*cos(i/5.0));
}
endShape();

void setup() {
  background(0);
 fill(255);
  size(500,500);
  frameRate(60);
  noStroke();
}
float s = 0;
float i = 200;
boolean increase = false;

void draw() {
  background(0);
  s += 0.05;
 if (increase && i < 200) {
   i++;
 } else if (!increase && i > 50) {
   i--;
 } else {
   increase = (increase ? false : true);
 }
 ellipse(width/2+i*sin(s), height/2+i*cos(s), 50, 50);
}