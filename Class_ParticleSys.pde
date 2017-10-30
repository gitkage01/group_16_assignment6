class ParticleSys {
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSys(PVector pos) {
    origin = pos.copy();
    particles = new ArrayList<Particle>();
  }
  
  void addParticle() {
    particles.add(new Particle(origin));
  }
  
  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
  void applyForce(PVector dir) {
    for (Particle p : particles) {
      p.applyForce(dir);
    }
  }
}