PImage ship;
color bgcolor = color(0, 0, 255);

//variables

float sX = 50;
float sY = 50;
float sSize = 30;
float sRadius = 25;
float sVelo = 10;


void setup() {
  size(800, 500);
  ship = loadImage("ship.png");
  frameRate(60);
  windowTitle("Bubble Blaster");
  background(bgcolor);
  startup();
}

void startup() {
  background(bgcolor);
  image(ship, sX-15, sY-15, 31, 31); 
  //circle(sX, sY, 28);
  
}

void draw() {
  
  
}


void keyPressed() {
  if (keyCode == LEFT) {
    
  }
  if (keyCode == RIGHT) {}
  if (keyCode == UP) {}
  if (keyCode == DOWN) {}
}