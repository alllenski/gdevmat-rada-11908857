
// Quiz 9

// Declare walkers
Walker[] walkers = new Walker[10];

Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

PVector wind = new PVector(0.1, 0);

void setup()
{
  // Setup canvas
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  reset();
  
}

void draw()
{
  background(255); 
  
  ocean.render();
  
  // Walk the walkers
  for (Walker walker: walkers)
  {
    walker.update();
    walker.render();
    
    PVector gravity = new PVector(0, -0.15 * walker.mass);
    walker.applyForce(gravity);
    
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = walker.velocity.copy();
    walker.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
    walker.applyForce(wind);
    if (ocean.isCollidingWith(walker))
    {
      PVector dragForce = ocean.calculateDragForce(walker);
      walker.applyForce(dragForce);
    }
  }

}

void reset()
{
   // Instantiate walkers
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker(i);
  }
}

void mouseClicked() {
  reset();
}
