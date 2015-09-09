public class ColorCycle{
  public float r;
  public float g;
  public float b;
  
  public ColorCycle() {
    r = floor(random(1,255));
    g = floor(random(1,255));
    b = floor(random(1,255));
  }
  
  void draw() {
    r -= 0.5;
    b -= 0.5;
    g -= 0.5;
    
    if(r<2){
      r=255;
    } 
    if(g<2){
      g=255;
    }
    if(b<2){
      b=255;
    }
  }
}