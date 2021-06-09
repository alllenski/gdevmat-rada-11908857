
void setup()
{
  // Setup canvas
  size(600, 600, P3D);
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);

}

// Instantiate walker
Walker perlinWalker = new Walker();

void draw()
{
  // Walk then display walkers
  perlinWalker.perlinWalk();
  perlinWalker.render();
  
}
