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
Ball[] balls;
int count= 50;
void setup() {
  size(400, 400);
  balls = new Ball[count] ;
  for ( int i = 0; i < count; i++ ) {
    balls[i] = new Ball(random(0, 200), random(0, 200), 50);
    balls[i].draw();
  }
}
