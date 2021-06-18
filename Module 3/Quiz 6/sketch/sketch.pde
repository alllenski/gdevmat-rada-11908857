
// Quiz 6

void setup()
{
  // Setup canvas
  size(600, 600, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
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
  background(255); 
  
  strokeWeight(6);
  
  PVector mouse = mousePosition();
  
  // Draw blade
  stroke(255, 0, 0);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  println(mouse.mag());
  
  // Draw handle
  mouse.setMag(30);
  stroke(128);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
  
}
