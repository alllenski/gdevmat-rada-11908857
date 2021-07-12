
// Quiz 7

// Declare walkers
Walker[] walkers = new Walker[100];

void setup()
{
  // Setup canvas
  size(800, 800, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Instantiate walkers
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
  }
  
}

// Get mouse position
PVector mousePosition()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(0); 
  
  // Update walkers
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].getDirection(mousePosition());
    walkers[i].update();
  }
  
  // Render walkers
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].render();
  }

}
