class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float lifespan;
  
  Particle(PVector l) {
    acc = new PVector(0, 0.05);
    vel = new PVector(random(-1, 1), random(-2, 0));
    pos = l.copy();
    lifespan = 255.0;
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    lifespan -= 1.0;
  }
  
  void applyForce(PVector f) {
    acc.add(f);
  }
  
  void display() {
    stroke(255, random(255), 255, lifespan);
    fill(255, random(255), random(255), lifespan);
    ellipse(pos.x, pos.y, 8, 8);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}