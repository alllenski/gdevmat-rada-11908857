
// Quiz 9

// Declare walkers
Walker[] walkers = new Walker[8];
float initialMew = 0.01f;
float midPointMew = 0.4f;

void setup()
{
  // Setup canvas
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  reset();
  
}

void draw()
{
  background(0); 
  
  // Walk the walkers
  for (Walker walker: walkers)
  {
    PVector acceleration = new PVector(0.2, 0);
    walker.update();
    walker.render();
    walker.applyForce(acceleration);
  }
  
  // Draw midpoint
  stroke(255);
  strokeWeight(2);
  line(0, Window.top, 0, Window.bottom);

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
