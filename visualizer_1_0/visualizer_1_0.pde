import ddf.minim.*;
import ddf.minim.analysis.*; 
Minim minim;
AudioInput song;
FFT fft;
 
void setup()
{
  
  size(512, 500);
 frameRate(60);
  minim = new Minim(this);
 
  song = minim.getLineIn(Minim.STEREO, 1024);
  fft = new FFT(song.bufferSize(), song.sampleRate());
  rectMode(CORNERS);
  noStroke();
}

void draw()
{
  
  blendMode(BLEND);
  fill(0, 5);
  rect(0, 0, width, height);
  fft.forward(song.mix);
  
  float red = map(mouseX, 0, width, 0, 255);
  float green = map(mouseY, 0, height, 0, 255);
  float blue = map(mouseX+mouseY, 0, width+height, 0, 255);
  
  fill(red, green, blue);
   for(int i = 0; i < fft.specSize() && (i*20)<width; i++)
  {
    float currentHeight = fft.getBand(i)*10;
    
    rect(i*20-10, height, i*20+10, height - currentHeight);
  }
}