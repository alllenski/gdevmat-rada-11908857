
// Quiz 2

void setup()
{
  // Setup canvas
  size(600, 600, P3D);
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}

Walker walker = new Walker();

void draw()
{
  walker.randomWalk();
  walker.render();
  
}
