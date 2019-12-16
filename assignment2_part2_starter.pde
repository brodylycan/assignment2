static final int BALL_SIZE = 20, BALL_HEIGHT = 20, BALL_SPEED = 2, NUM_BALLS = 10;
static final int BOX_HEIGHT = 40, BOX_SPEED = 1, BOX_MAX = 100, COLOR_CHANGE = 5;
static final int SCORE_HEIGHT = 70, SCORE_SIZE = 16, FINISH_SIZE = 32, FINISH_SCORE = 51;

// Declaring objects and variables
Ball[] balls;             // Array of Ball objects to be dropped
Box box;                  // Box object that moves back and forth across the screen
int score = 0;            // Counter keeping track of current score
int ballToBeDropped = 0;  // index of the ball to be dropped
PFont f;                  // PFont object for displaying text

PImage ship;
PImage enemy;
PImage bullet;
PImage stars;


void setup() {
  size(400, 400, P2D);
  
  // initialize Ball and Box objects
  box = new Box();
  balls = new Ball[NUM_BALLS];
  for (int i = 0; i < NUM_BALLS; i++) {
    balls[i] = new Ball();
    
    ship = loadImage("ship.png");
    bullet = loadImage("bullet.png");
    enemy = loadImage("enemy.png");
    stars = loadImage("stars.jpg"); 
    
  }
  
  // initialize PFont
  f = createFont("Arial", FINISH_SIZE, true);
}

void draw() {
  background(0);
  
  image(stars,0,0,width,height);
  
  // black circle that follows the horizontal position of mouse cursor
  fill(0);
  
  image(ship ,mouseX-BALL_SIZE/2, BALL_HEIGHT/2,BALL_SIZE,BALL_SIZE);
  
  // Animate each ball & Increment the score counter if a ball scores
  for (int i = 0; i < NUM_BALLS; i++) {
    if (score < FINISH_SCORE && balls[i].scored(box.boxX, box.boxWidth)) {
      score++;
    }
    balls[i].move();
    balls[i].display();
  }
  
  
  // Animate the box
  box.move();
  box.display();
  
  // Text that displays the progress of the game
  if (score < FINISH_SCORE) {
    displayScore();
  } else {
    displayFinished();
  }
}

void mouseReleased() {
  // Drop the current ball only if it hasn't been dropped
  if (!balls[ballToBeDropped].dropped) {
    balls[ballToBeDropped].drop(mouseX);
    ballToBeDropped++; // move onto the next ball
    
    // make sure that the current ball is within the array
    if (ballToBeDropped >= NUM_BALLS) {
      ballToBeDropped = 0;
    }
  }
}

void displayScore() {
  textFont(f, SCORE_SIZE);
  fill(255);
  textAlign(CENTER);
  text("Score: " + score, width/2, height-SCORE_HEIGHT);
}

void displayFinished() {
  textFont(f, FINISH_SIZE);
  fill(255);
  textAlign(CENTER);
  text("You Won!", width/2, height/2);
}
