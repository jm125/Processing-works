public class Baton {
  private float _size;
  private float _centerX;
  private float _centerY;
  public float _speed;
  private float _batonCircleRadius = 20;
  private float axisX;
  private float axisY;
  private float angle = 0;
  
  public Baton(float size, float centerX, float centerY, float initSpeed) {
    _size = size;
    _centerX = centerX;
    _centerY = centerY;
    _speed = initSpeed;
  }
  
  public void SetSpeed(float newSpeed) {
    _speed = newSpeed;
  }
  
  void draw() {
    _speed *= .95;
    angle += _speed;
    axisX = _centerX + 1.5*_size*cos(radians(angle/2));
    axisY = _centerY + 1.5*_size*sin(radians(angle/2));
    
    float x1 = axisX - _size*cos(radians(angle));
    float x2 = axisX + _size*cos(radians(angle));
    float y1 = axisY - _size*sin(radians(angle));
    float y2 = axisY + _size*sin(radians(angle));
  
    line(x1,y1,x2,y2);
    ellipse(x1,y1,_batonCircleRadius,_batonCircleRadius);
    ellipse(x2,y2,_batonCircleRadius,_batonCircleRadius);
  }
}