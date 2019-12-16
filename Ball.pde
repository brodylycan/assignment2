class Ball {
  float x;
  float y;
  boolean dropped;
  
  Ball() {
    x = -BALL_SIZE;
    y = -BALL_SIZE;
    dropped = false;
  }
  
  void display() {
    fill(255,0,0);
    image(bullet,x-BALL_SIZE/2, y-BALL_SIZE/2,BALL_SIZE,BALL_SIZE);
  }
  
  void drop(float x_) {
    x = x_;
    y = BALL_HEIGHT;
    dropped = true;
  }
  
  void move() {
    if (dropped) y += BALL_SPEED;
    if (y > height + BALL_SIZE) dropped = false;
  }
  
  boolean scored(float boxX_, int boxWidth_) {
    // evaluate when the ball touches the top of the box
    if (y + BALL_SIZE / 2 == height - BOX_HEIGHT) {
      // score if the center of the ball is within the box width
      return (x >= boxX_ && x <= boxX_ + boxWidth_);
    }
    return false;
  }
}
