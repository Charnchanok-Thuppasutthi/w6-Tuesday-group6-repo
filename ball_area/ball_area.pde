Block[] blocks;

double sum = 0 ;
int amount = 5; // amount of objects.
boolean check_ball;

void setup() { 
  size(600, 600);
  background(200);
  /* balls = new Ball[amount];
  blocks = new Block[amount];

  for (int x = 0; x < amount; x++) {
    balls[x] = new Ball(random(50, 550), random(50, 550), random(50, 250));
    blocks[x] = new Block(random(50, 550), random(50, 550), random(50, 250));
  }

  for (Ball ball : balls) {   
    sum +=ball.getArea();
  }
  for (Block block : blocks) {
    sum +=block.getArea();
  }
  println ("sum of area is",sum);*/
  blocks = new Block[1];
  blocks[0] = new Block(random(50, 550), random(50, 550), random(50, 250));
  blocks[0].balls = new Ball[3];
  blocks[0].balls[0] =new Ball(blocks[0].positionX, blocks[0].positionY, blocks[0].size);
  blocks[0].balls[1] =new Ball(blocks[0].positionX, blocks[0].positionY, blocks[0].size);
  blocks[0].balls[2] =new Ball(blocks[0].positionX, blocks[0].positionY, blocks[0].size);
}

void draw() {
  background(255);
  /* for (Block block : blocks) { 
    //block.random_color = color(random(0, 255), random(0, 255), random(0, 255));
    block.create_block();
  }
  for (Ball ball : balls) { 
    //ball.random_color = color(random(0, 255), random(0, 255), random(0, 255));
    ball.create_ball();
  }*/

  for (Block block : blocks) { 
    //block.random_color = color(random(0, 255), random(0, 255), random(0, 255));
    block.create_block();
  }
  for (Ball ball : blocks[0].balls) { 
    //ball.random_color = color(random(0, 255), random(0, 255), random(0, 255));
    ball.create_ball();
    }
  
}


class Ball {
  float positionX, positionY, size;
  int fashing;
  color random_color;

  Ball(float positionX, float positionY, float size) {
    this.positionX = positionX ;
    this.positionY = positionY ;
    this.size = size; 
    this.random_color = color(random(0, 255), random(0, 255), random(0, 255));
    this.fashing = 0;
  }
  int colors = 255;
  int count = -1;
  void create_ball() {
    ellipseMode(CORNER);
    if (this.fashing == 1){
      color white = color(255);
      color[] colors = {white,random_color};
      int rand = int(random(0,2));
      fill(colors[rand]);
      ellipse(this.positionX, this.positionY, this.size, this.size);
    }
    else {
      fill(random_color);
      ellipse(this.positionX, this.positionY, this.size, this.size);
    }
  }
  public float getArea() {
    float area ;
    area = 22/7 * (size/2) *(size/2);
    return area ;
  }
}


class Block {
  float positionX, positionY, size;
  int fashing;
  color random_color;
  Ball[] balls;
  Block(float pos_x1, float pos_y1, float size) {
    this.positionX = pos_x1 ;
    this.positionY = pos_y1 ;
    this.size = size ;
    this.random_color = color(random(0, 255), random(0, 255), random(0, 255));
    this.fashing = 0;
  }

  void create_block() {
    if (this.fashing == 1){
      color white = color(255);
      color[] colors = {white,random_color};
      int rand = int(random(0,2));
      fill(colors[rand]);
      rect( positionX, positionY, size, size);
    }
    else {
      fill(random_color);
      rect( positionX, positionY, size, size);
    }
  }
  public float getArea() {
    float area ;
    area = size * size ;
    return area ;
  }
}

void mouseClicked() {
  Ball[] balllist_left;
  Ball[] balllist_right;
  Block[] boxlist_left;
  Block[] boxlist_right;
  check_ball = true;

  for (int i = blocks[0].balls.length-1; i >= 0; i = i - 1) { // find the ball where clicked and delete it 
    float dis = dist(mouseX, mouseY, blocks[0].balls[i].positionX, blocks[0].balls[i].positionY);
    if (dis < blocks[0].balls[i].size/2 && blocks[0].balls[i].fashing == 0) {
      sum -= blocks[0].balls[i].getArea();
      println("this ball area is",blocks[0].balls[i].getArea());
      println("New sum of area is", sum);
      balllist_left = (Ball[])subset (blocks[0].balls, 0, i);
      balllist_right = (Ball[])subset (blocks[0].balls, i+1 );
      blocks[0].balls = (Ball[])concat(balllist_left, balllist_right);
      check_ball = false;
      break;
    }
  }

  if (check_ball == true) {
    for (int i = blocks.length-1; i >= 0; i = i - 1) {  // find the block where clicked and delete it
      if (mouseX > blocks[i].positionX &&  mouseX < blocks[i].positionX + blocks[i].size && mouseY > blocks[i].positionY &&  mouseY < blocks[i].positionY + blocks[i].size && blocks[i].fashing == 0) {
        sum -= blocks[i].getArea();
        println("this block area is",blocks[i].getArea());
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
