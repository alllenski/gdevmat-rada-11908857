
// Quiz 8

// Declare walkers
Walker[] walkers = new Walker[10];
PVector wind = new PVector(0, -0.4);
PVector gravity = new PVector(0.15, 0);

void setup()
{
  // Setup canvas
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Instantiate walkers
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
  }
  
}

void draw()
{
  background(0); 
  
  // Walk the walkers
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].update();
    walkers[i].render();
    walkers[i].applyForce(wind);
    walkers[i].applyForce(gravity);
  }

}
