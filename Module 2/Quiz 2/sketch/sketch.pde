
// Quiz 2

void setup()
{
  // Setup canvas
  size(600, 600, P3D);
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}

// Instantiate the walkers
Walker walker = new Walker();
Walker biasedWalker = new Walker();

void draw()
{
  // Make the walkers walk
  walker.randomWalk();
  biasedWalker.randomWalkBiased();
  
  // Display the walkers
  walker.render();
  biasedWalker.render();
  
}
