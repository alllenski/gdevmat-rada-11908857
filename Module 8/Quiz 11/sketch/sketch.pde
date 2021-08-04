
// Quiz 9

// Declare walkers
Walker[] walkers = new Walker[8];

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
  for (Walker walker : walkers)
  {
    for (Walker otherWalker : walkers)
    {
      if(walker != otherWalker)
      {
        walker.update();
        walker.render();
        walker.applyForce(otherWalker.calculateAttraction(walker));
      }
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
