class Box {
  int boxX;
  int boxWidth;
  int boxSpeed;
  color c;
  
  Box() {
    boxX = 0;
    boxWidth = int(random(BALL_SIZE, BOX_MAX));
    boxSpeed = BOX_SPEED;
    c = color(0, 0, 255);
  }
 
  void move() {
    if (boxX < -boxWidth || boxX > width) {
      int newSize = int(random(BALL_SIZE, BOX_MAX));

      /* If the box exits the left edge
       * reposition boxX to account for its new size
       * so that it doesn't jump */
      if (boxX < -boxWidth) boxX = -newSize;
      
      boxWidth = newSize;
      boxSpeed = -boxSpeed;
    }
    
    boxX += boxSpeed;
  }

  void display() {
    fill(c);
    image(enemy,boxX, height - BOX_HEIGHT, boxWidth, BOX_HEIGHT);
  }
}
