Ball[] balls;
Block[] blocks;
float sum = 0 ;
int count = 5; // number of objects.

void setup() { 
  size(600, 600);
  background(200);
  balls = new Ball[count];
  blocks = new Block[count];
  //int index = 0 ;

  for (int x = 0; x < count; x++) {
    /*float randomsize = int(random(50, 100));
    float randomX = int(random(randomsize/2, 600-randomsize));
    float randomY = int(random(randomsize/2, 600-randomsize));*/
    balls[x] = new Ball( random(50,400),random(50,300),random(50,150) );
    blocks[x] = new Block(random(50,400),random(300,450) );
  }

  for (Ball ball : balls) { // draw a circle in the first time to see
    ball.create_ball();
    sum += ball.getArea();
  }
  for (Block block : blocks) { 
    block.create_block();
    sum += block.getArea();
  }
  println("Sum of area is :", sum);
}

void draw() {
  mouseclick();
}


class Ball {
  float positionX, positionY, size;
  color random_color;

  Ball(float positionX, float positionY, float size) {
    this.positionX = positionX ;
    this.positionY = positionY ;
    this.size = random(100,200); ;
    this.random_color = color(random(0,255),random(0,255),random(0,255));
  }
  void create_ball() {
    ellipseMode(CORNER);
    fill(random_color);
    circle(this.positionX, this.positionY, this.size);
  }
  public float getArea() {
    float area ;
    area = 22/7 * (size/2) *(size/2);
    return area ;
  }
  void delete() {
    this.size = 0;
    update();
  }
}

class Block {
  float positionX, positionY, size;
  color random_color;
  Block(float pos_x1, float pos_y1) {
    this.positionX = pos_x1 ;
    this.positionY = pos_y1 ;
    this.size = random(100,150) ;
    this.random_color = color(random(0,255),random(0,255),random(0,255));
  }
  void create_block() {
    fill(random_color);
    rect( positionX, positionY, size, size);
  }
  public float getArea() {
    float area ;
    area = size * size ;
    return area ;
  }

  void delete() {
    this.size = 0;
    update();
  }
}


void mouseclick() {
  if (mousePressed) {
    int check = 0 ; // check if clicked miss circle or rect dont do anything 
    delay(250);
    for (int x = 0; x < balls.length; x++) {
      if (mouseX > balls[x].positionX && mouseX < balls[x].positionX + balls[x].size && mouseY > balls[x].positionY && mouseY <= balls[x].positionY + balls[x].size) {
        sum -= balls[x].getArea();
        println("\n");
        println("this circle has area =", balls[x].getArea());
        balls[x].delete();
        check = 1;
      }
    }
    for (int x = 0; x < blocks.length; x++) {
      if (mouseX > blocks[x].positionX && mouseX < blocks[x].positionX + blocks[x].size && mouseY > blocks[x].positionY && mouseY <= blocks[x].positionY + blocks[x].size) {
        sum -= blocks[x].getArea();
        println("\n");
        println("this block has area =", blocks[x].getArea());
        blocks[x].delete();
        check = 1;
      }
    }
    if (check == 0) {
    } else {
      println("New sum of area is", sum);
    }
  }
}

void update() {
  background(200);
  for (Ball ball : balls) {
    ball.create_ball();
  }
  for (Block block : blocks) { 
    block.create_block();
  }
}
