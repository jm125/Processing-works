import ddf.minim.analysis.*;
import ddf.minim.*;
import controlP5.*;

Minim minim;
//AudioPlayer input;
AudioInput input;
FFT fftLog;

ControlP5 cp5;

// Setup params
color bgColor = color(0,0,0);

// Modifiable parameters
float spectrumScale = 2;
float STROKE_MAX = 10;
float STROKE_MIN = 2;
float strokeMultiplier = 1;
float audioThresh = .9;
float[] circles = new float[29];
float DECAY_RATE = 2;

void setup(){
  size(800,800, P3D);
  
  frameRate(60);
  
  minim = new Minim(this);
  cp5 = new ControlP5(this);
  //input = minim.loadFile("1983.mp3");
  input = minim.getLineIn(Minim.STEREO);
  //input.play();
  
  fftLog = new FFT( input.bufferSize(), input.sampleRate());
  fftLog.logAverages( 22, 3);
  
  noFill();
  ellipseMode(RADIUS);
  
  cp5.addSlider("STROKE_MIN")
    .setRange(0,40);
    
   cp5.addSlider("STROKE_MAX")
    .setRange(0,40);
    
   cp5.addSlider("audioThresh")
    .setRange(0,1);
}
float r=255;
float g=255;
float b=255;
void draw(){
  blendMode(BLEND);
  fill(0, 5);
  rect(0, 0, width, height);
  pushMatrix();
  translate(width/2, height/2);
  
  // Push new audio samples to the FFT
  fftLog.forward(input.left);
  r-=0.2;
  g-=0.5;
  b-=0.9;
   
  if(r<2){
    r=255;
  }
   
  if(g<2){
    g=255;
  }
   
  if(b<2){
    b=255;
  }
  // Loop through frequencies and compute width for ellipse stroke widths, and amplitude for size
  for (int i = 0; i < 29; i++) {
    
    // What is the average height in relation to the screen height?
    float amplitude = fftLog.getAvg(i);
    
    // If we hit a threshhold, then set the circle radius to new value
    if (amplitude<audioThresh) {
      circles[i] = amplitude*(height/2);
    } else { // Otherwise, decay slowly
      circles[i] = max(0, min(height,circles[i]-DECAY_RATE));
    }
    
    // What is the centerpoint of the this frequency band?
    float centerFrequency = fftLog.getAverageCenterFrequency(i);
    
    // What is the average width of this freqency?
    float averageWidth = fftLog.getAverageBandWidth(i);
    
    // Get the left and right bounds of the frequency
    float lowFreq = centerFrequency - averageWidth/2;
    float highFreq = centerFrequency + averageWidth/2;
    
    // Convert frequency widths to actual sizes
    int xl = (int)fftLog.freqToIndex(lowFreq);
    int xr = (int)fftLog.freqToIndex(highFreq);
      
    pushStyle();
    // Calculate the gray value for this circle
//    stroke(amplitude*255);
    stroke(r,g,b,amplitude*255);
    //strokeWeight(map(amplitude, 0, 1, STROKE_MIN, STROKE_MAX));
    strokeWeight((float)(xr-xl)*strokeMultiplier);
    
    // Draw an ellipse for this frequency
    ellipse(0, 0, circles[i], circles[i]);
    
    popStyle();
    
    println(i);
  }
  popMatrix(); 
}