Ball[] balls;
Block[] blocks;
double sum = 0 ;
int count = 5; // number of objects.
boolean check_ball;
void setup() { 
  size(600, 600);
  background(200);
  balls = new Ball[count];
  blocks = new Block[count];


  for (int x = 0; x < count; x++) {
    balls[x] = new Ball(random(50, 550), random(50, 550), random(50, 250));
    blocks[x] = new Block(random(50, 550), random(50, 550), random(50, 250));
  }
  
  for (Ball k : balls){
    sum +=k.getArea();
  }
  for (Block j : blocks){
    sum +=j.getArea();
  }
  println (sum);
}

void draw() {
  //mouseclick();
  background(255);
  for (Block block : blocks) { 
    block.create_block();
  }
  for (Ball ball : balls) { // draw a circle in the first time to see
    ball.create_ball();
  }
}


class Ball {
  float positionX, positionY, size;
  color random_color;

  Ball(float positionX, float positionY, float size) {
    this.positionX = positionX ;
    this.positionY = positionY ;
    this.size = random(100, 200); 
    ;
    this.random_color = color(random(0, 255), random(0, 255), random(0, 255));
  }
  void create_ball() {

    fill(random_color);
    ellipse(this.positionX, this.positionY, this.size, this.size);
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
  Block(float pos_x1, float pos_y1, float size) {
    this.positionX = pos_x1 ;
    this.positionY = pos_y1 ;
    this.size = random(100, 200) ;
    this.random_color = color(random(0, 255), random(0, 255), random(0, 255));
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

void update() {
  background(200);
  for (Ball ball : balls) {
    ball.create_ball();
  }
  for (Block block : blocks) { 
    block.create_block();
  }
}

void mouseClicked() {
  Ball[] balllist_left;
  Ball[] balllist_right;
  Block[] boxlist_left;
  Block[] boxlist_right;
  check_ball = true;

  for (int i = balls.length-1; i >= 0; i = i - 1) {
    float dis = dist(mouseX, mouseY, balls[i].positionX, balls[i].positionY);
    if (dis < balls[i].size/2) {
      sum -= balls[i].getArea();
      println("New sum of area is", sum);
      balllist_left = (Ball[])subset (balls, 0, i);
      balllist_right = (Ball[])subset (balls, i+1 );
      balls = (Ball[])concat(balllist_left, balllist_right);
      check_ball = false;
      break;
    }
  }
  
  if (check_ball == true) {
    for (int i = blocks.length-1; i >= 0; i = i - 1) {
      if (mouseX > blocks[i].positionX &&  mouseX < blocks[i].positionX + blocks[i].size && mouseY > blocks[i].positionY &&  mouseY < blocks[i].positionY + blocks[i].size) {
        sum -= blocks[i].getArea();
        println("New sum of area is", sum);
        boxlist_left = (Block[])subset (blocks, 0, i);
        boxlist_right = (Block[])subset (blocks, i+1 );
        blocks = (Block[])concat(boxlist_left, boxlist_right);
        check_ball = false;
        break;
      }
    }
  }
}
