import ddf.minim.*;
import ddf.minim.analysis.*; 
Minim minim;
AudioPlayer song;
FFT fft;
 
void setup()
{
  
  size(512, 200);
 
  minim = new Minim(this);
 
  // this loads mysong.wav from the data folder
  song = minim.loadFile("Blossom.mp3");
  song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());
}

float seed = random(0,255);
float seedX = seed;
float seedY = seed;
float seedZ = seed;
void draw()
{
  background(220);
  fft.forward(song.mix);
  
  seedX = (seedX < 256 ? seedX + 1 : 0);
  seedY = (seedY >= 0 ? seedY - 1 : 255);
  seedZ = (seedZ + random(0,5)) % 255;
  
  stroke(seedX, seedY, seedZ);
  // we draw the waveform by connecting neighbor values with a line
  // we multiply each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
   for(int i = 0; i < fft.specSize(); i++)
  {
    line(i, height, i, height - fft.getBand(i)*100);
  }
}