import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput input;
FFT fftLog;

void setup() {
  background(255);
  size(500,500);
  
  minim = new Minim(this);
  input = minim.getLineIn(Minim.STEREO);
  
  fftLog = new FFT( input.bufferSize(), input.sampleRate());
  fftLog.logAverages( 22, 3);
  
  
}

void draw() {
 //
 
 float delta = 0.1;
  float x;
  for(int j = 0; j < 29; j++) {
    float amplitude = fftLog.getAvg(j); 
    for (float i =0; i < width; i += delta) {
      x = lerp(i, width, i/width);
      point(x,(height/2+100*noise(x))+amplitude);
    }
  }
}