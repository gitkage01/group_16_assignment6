class Ball {
  
  float radius;
  float x = width/2, y = height/2;
  float vy, vx;
  float ay, ax;
  float fy, fx;
  float ry = height/2;
  float rx = width/2;
  float m = 1.0;
  float ks = 0.1;
  float kd = 0.1;
  
  Ball() {}
  
  void springY() {
    
    fy = -((ks * (y - ry)) + kd * vy);
    ay = fy/m;
    vy += ay;
    y += vy;
    
  }
  
  void springX() {
    
    fx = -((ks * (x - rx)) + kd * vx);
    ax = fx/m;
    vx += ax;
    x += vx;
    
  }
  
  void display() {
    
    strokeWeight(5);
    stroke(255, 255, 255);
    line(width/2, height/2, x, y);
    fill(0, 191, 255);
    ellipse(x, y, radius, radius);
    fill(255, 255, 0);
    ellipse(x, y, radius/1.5, radius/1.5);
    image(star, x, y, width/18, height/13);

    
  }
}