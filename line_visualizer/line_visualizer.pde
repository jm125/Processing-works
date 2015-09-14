import ddf.minim.*;

Minim minim;
AudioInput lineIn;
AudioLine audioLine;

void setup() {
  size(500,500);
  minim = new Minim(this);
  lineIn = minim.getLineIn(Minim.STEREO);
  
  audioLine = new AudioLine(200, lineIn, 5, 200);
}

void draw() {
   background(255);
   audioLine.draw();
}