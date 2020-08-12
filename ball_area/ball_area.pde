Ball[] balls;
float sum = 0 ;

void setup(){ // create array of object in name balls
  size(300,500);
  background(0);
  balls = new Ball[10];
  int index = 0 ;
  
  for (int x = 0; x < 10; x++){
    float randomsize = int(random(50,100));
    float randomX = int(random(randomsize/2,300-randomsize));
    float randomY = int(random(randomsize/2,500-randomsize));
    balls[index++] = new Ball(randomX, randomY, randomsize);
  }
  
  for (Ball ball : balls){ // draw a circle in the first time to see
    ball.create_ball();
    sum += ball.getArea();
  } 
  
  println("Sum of area is :",sum);
}

void draw(){
  mouseclick();
}

class Ball {
  float positionX, positionY, size;
  
  Ball(float positionX, float positionY, float size) {
    this.positionX = positionX ;
    this.positionY = positionY ;
    this.size = size ;
  }

  void create_ball() {
    ellipseMode(CORNER);
    circle(this.positionX, this.positionY, this.size);
  }
  
  public float getArea(){
    float area ;
    area = 22/7 * (size/2) *(size/2);
    return area ;
  }
  
  void delete() {
    this.size = 0;
    update();
  }
}

void mouseclick(){
  if (mousePressed){
    int check = 0 ;
    delay(150);
    for (int x = 0; x < balls.length; x++){
      if (mouseX > balls[x].positionX && mouseX < balls[x].positionX + balls[x].size && mouseY > balls[x].positionY && mouseY <= balls[x].positionY + balls[x].size){
        sum -= balls[x].getArea();
        println("this circle has area =",balls[x].getArea());
        balls[x].delete();
        check = 1;
      }  
    }
    if (check == 0){
      println("don't have a circle in this area!!!");
    }
    else {
      println("New sum of area is", sum);
    }
  }
}

void update(){
  background(0);
  for (Ball ball : balls){
    ball.create_ball();
  }
}
