
// Midterm Exam

// Keep track of frame count
int frame = 0;

// Instantiate black hole and matter
BlackHole blackHole = new BlackHole();
Matter[] matters = new Matter[100];

void setup()
{
  // Setup canvas
  size(600, 600, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  reset();
  
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
  // Reset sketch every 300 frames
  if (frame % 300 == 0) { reset(); }
  frame++;
  
  background(0); 
  
  // Move matter and black hole
  for (int i = 0; i < matters.length; i++)
  {
    matters[i].followBlackHole(blackHole.position);
  }
  blackHole.followMouse();
  
  // Render matter and black hole
  for (int i = 0; i < matters.length; i++)
  {
    matters[i].render();
  }
  blackHole.render();

}

void reset()
{
  // Create new matter and black hole
  for (int i = 0; i < matters.length; i++)
  {
    matters[i] = new Matter();
  }
  blackHole = new BlackHole();
  
}
