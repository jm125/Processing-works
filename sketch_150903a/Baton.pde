public class Baton {
  private float _length;
  private float _centerX;
  private float _centerY;
  public float _speed;
  private float _batonCircleRadius = 20;
  private float axisX;
  private float axisY;
  private float angle = 0;
  
  public Baton(float size, float centerX, float centerY, float initSpeed) {
    _length = size;
    _centerX = centerX;
    _centerY = centerY;
    _speed = initSpeed;
  }
  
  void draw() {
    angle += _speed;
    axisX = _centerX + 1.5*_length*cos(radians(angle/2));
    axisY = _centerY + 1.5*_length*sin(radians(angle/2));
    
    float x1 = axisX - _length*cos(radians(angle));
    float x2 = axisX + _length*cos(radians(angle));
    float y1 = axisY - _length*sin(radians(angle));
    float y2 = axisY + _length*sin(radians(angle));
    
    stroke(255);
    line(x1,y1,x2,y2);
    ellipse(x1,y1,_batonCircleRadius,_batonCircleRadius);
    ellipse(x2,y2,_batonCircleRadius,_batonCircleRadius);
  }
}