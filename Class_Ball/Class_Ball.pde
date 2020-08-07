class Ball {
  float x, y;
  int s;
  Ball(float position_x, float position_y, int size) { //constructor
    x = position_x ;
    y = position_y ;
    s = size;
  }
  void draw() {
    circle( x, y, s);
  }
}
/********************************************/
void setup() {
  Ball ball= new Ball(150, 300, 100);
  size(400, 400);
  ball1.draw();
}
