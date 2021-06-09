class Walker
{
  // Coordinates and scale
  float x;
  float y;
  float s;
  
  // Variables for perlin noise
  float tx = 456, ty = 123, ts = 789; // Coordinates and scale
  float tr = 123, tg = 234, tb = 345; // Color
  
  // Draw the walker
  void render()
  {
    // Remove stroke
    noStroke();
    
    // Randomize color with perlin noise
    fill(map(noise(tr), 0, 1, 0, 255),
        map(noise(tg), 0, 1, 0, 255),
        map(noise(tb), 0, 1, 0, 255));
    
    // Draw the walker with perlin noise
    circle(x, y, map(noise(ts), 0, 1, 5, 150));
    
  }
  
  // Walk randomly
  void perlinWalk()
  {
    // Generate new coordinates within window using perlin noise
    x = map(noise(tx), 0, 1, -width / 2, width / 2);
    y = map(noise(ty), 0, 1, -height / 2, height / 2);
    
    // Increment values for perlin noise
    tx += 0.01f;
    ty += 0.01f;
    ts += 0.01f;
    tr += 0.01f;
    tg += 0.01f;
    tb += 0.01f;
    
  }
  
}
