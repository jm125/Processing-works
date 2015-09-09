import ddf.minim.*;

Minim minim;

AudioInput groove;
AudioRenderer radar, vortex, iso;
AudioRenderer[] visuals; 

int select;
 
void setup()
{
  // setup graphics
  size(512, 512, P3D);
    
  // setup player
  minim = new Minim(this);
  groove = minim.getLineIn(minim.STEREO);

  // setup renderers
  vortex = new VortexRenderer(groove);
  radar = new RadarRenderer(groove);
  iso = new IsometricRenderer(groove);
  
  visuals = new AudioRenderer[] {radar, vortex,  iso};
  
  // activate first renderer in list
  select = 0;
  groove.addListener(visuals[select]);
  visuals[select].setup();
}
 
void draw()
{
  visuals[select].draw();
}
 
void keyPressed() {
   groove.removeListener(visuals[select]);
   select++;
   select %= visuals.length;
   groove.addListener(visuals[select]);
   visuals[select].setup();
}

void stop()
{
  groove.close();
  minim.stop();
  super.stop();
}