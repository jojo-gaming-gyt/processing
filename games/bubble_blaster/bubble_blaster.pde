color bgcolor = color(0, 0, 255);
color shipcolor = color(255, 0, 0);

//variables

float sX = 50;
float sY = 50;
float sSize = 30;
float sRadius = 25;


void setup() {
  size(800, 500);
  frameRate(60);
  windowTitle("Bubble Blaster");
  background(bgcolor);
  startup();
}

void startup() {
  background(bgcolor);
  fill(255);
  circle(sX, sY, sRadius);
  fill(shipcolor);
  triangle(sX-sRadius/2, sY-sRadius/2, sX, sY+sRadius, sX + sRadius, sY);
  
  
}

void draw() {
  
  
}
