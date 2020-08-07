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
class Block {
  float x1,x2,y1,y2 ;
  Block(float pos_x1, float pos_y1, float pos_x2, float pos_y2) { //constructor
    x1 = pos_x1 ;
    y1 = pos_y1 ;
    x2 = pos_x2;
    y2 = pos_y2;
  }
  void draw() {
    rect(x1,y1,x2,y2);
  }
}
/********************************************/
Ball[] balls;
Block[] blocks;
int count= 50;

void setup() {
  size(400, 400);
  balls = new Ball[count] ;
  blocks = new Block[count];
  for ( int i = 0; i < count; i++ ) {
    balls[i] = new Ball(random(0, 400), random(0, 200), 50);
    balls[i].draw();
    blocks[i] = new Block(random(0,400),random(200,400),50,50);
    blocks[i].draw();
  }
}
