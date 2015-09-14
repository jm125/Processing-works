import ddf.minim.*;

public class AudioLine {
  private float _length;
  private float _centerX;
  private float _centerY;
  public float _speed;
  private float _batonCircleRadius = 20;
  private float angle = 0;
  private AudioInput _input;
  private float _amplitude;
  
  public AudioLine(float lineLength, AudioInput input, float initSpeed, float amplitude) {
    _length = lineLength;
    _centerX = width/2;
    _centerY = height/2;
    _speed = initSpeed;
    _input = input;
    _amplitude = amplitude;
  }
  
  void draw() {
    angle += _speed;
    pushMatrix();
    //rotate(radians(angle));
    
    float startY = _centerY;
    float endY = _centerY;
    
    for(int i = 0; i < _input.bufferSize() - 1; i++)
    {
      float xLocation = map(i, 0, _input.bufferSize(), _centerX-_length, _centerX+_length);
      line( xLocation, _centerY,  xLocation, _centerY  - _input.mix.get(i+1)*_amplitude );
      if(i == 0) {
        startY -= _input.mix.get(i)*_amplitude;
      } else if (i == _input.bufferSize()-2) {
        endY -= _input.mix.get(i)*_amplitude;
      }
    }
    
    ellipse(_centerX-_length,startY,_batonCircleRadius,_batonCircleRadius);
    ellipse(_centerX+_length,endY,_batonCircleRadius,_batonCircleRadius);
    popMatrix();
  }
}