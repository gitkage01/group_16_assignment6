// The mouse interactivity portion of this code was inspired by code provided by the processing.org website
// The particle motion and wind effects were inspired by code provided by the processing.org website

superball b;
Ball ball1;
float xOffset = 0.0, yOffset = 0.0;
boolean locked = false;
PImage star;
ParticleSys ps;

void setup() {
  
  size(1280, 720);
  frameRate(60);
  ellipseMode(RADIUS);
  imageMode(CENTER);

  ball1 = new Ball();
  ball1.vy = 0;
  ball1.radius = 60;
  
  b= new superball();
  b.vx=0;
  b.vy=0;
  b.x=400;
  b.y=50;
  b.m=100;
  
  ps = new ParticleSys(new PVector(width/2, 50));
  
}

void draw() {
  
  background(0);
  //ps.addParticle();
  //ps.run();
  
  float dx = map(ball1.x, 0, width, -0.1, 0.1);
  PVector wind = new PVector(dx, 0);
  ps.applyForce(wind);
  ps.run();
  for (int i = 0; i < 2; i++) {
    ps.addParticle();
  }
  
  
  star = loadImage("star1.png");
  
  fill(255, 255, 255);
  ball1.display();
  ball1.springY();
  ball1.springX();
  
  b.gravity();
  b.update();
  b.display();
  
}

void mouseClicked(){  
  b.vx=b.vx+(b.x-mouseX)*3;
  b.vy=b.vy+(b.y-mouseY)*3;
}
void mousePressed() {
  if (mouseX > ball1.x-ball1.radius && mouseX < ball1.x+ball1.radius && 
      mouseY > ball1.y-ball1.radius && mouseY < ball1.y+ball1.radius) {
    locked = true;
  }
  else {
    locked = false;
  }
  xOffset = mouseX-ball1.x;
  yOffset = mouseY-ball1.y;
}
  
void mouseDragged() {
  if (locked) {
    ball1.x = mouseX-xOffset;
    ball1.y = mouseY-yOffset;
  }
}
  
void mouseReleased() {
  locked = false;
}