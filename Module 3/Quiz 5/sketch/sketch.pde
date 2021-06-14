
// Quiz 5

void setup()
{
  // Setup canvas
  size(600, 600, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
}

// Instantiate the walker
Walker walker = new Walker();

void draw()
{
  background(255); 
  
  // Move and bounce the walker
  walker.moveAndBounce();
  
  // Display the walker
  walker.render();
  
}
