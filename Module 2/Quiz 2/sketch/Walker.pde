class Walker
{
  // Coordinates
  float x;
  float y;
  
  // How far each walker steps
  float stepDistance = 5;
  
  // Draw the walker
  void render()
  {
    // Remove stroke
    noStroke();
    
    // Randomize color and alpha values
    fill(random(255), random(255), random(255), random(50) + 50);
    
    // Draw the walker
    circle(x, y, 30);
    
  }
  
  // Walk randomly
  void randomWalk()
  {
    // Pick a direction to walk (8-directions)
    int rng = int(random(9));
    if (rng == 0)
    {
      y -= stepDistance;
    }
    else if (rng == 1)
    {
      y += stepDistance; 
    }
    else if (rng == 2)
    {
      x += stepDistance;
    }
    else if (rng == 3)
    {
      x -= stepDistance; 
    }
    else if (rng == 4)
    {
      x -= stepDistance; 
      y -= stepDistance;
    }
    else if (rng == 5)
    {
      x -= stepDistance; 
      y += stepDistance;
    }
    else if (rng == 6)
    {
      x += stepDistance;
      y -= stepDistance;
    }
    else if (rng == 7)
    {
      x += stepDistance;
      y += stepDistance;
    }
    
  }
  
  // Walk randomly with bias
  void randomWalkBiased()
  {
    // Pick a direction to walk (4-directions)
    /* 
    20% = Down
    20% = Up
    40% = Right
    20% = Left
    */
    int rng = int(random(10));
    if (rng < 2)
    {
      y -= stepDistance;
    }
    else if (rng < 4)
    {
      y += stepDistance; 
    }
    else if (rng < 8)
    {
      x += stepDistance;
    }
    else if (rng < 10)
    {
      x -= stepDistance; 
    }
    
  }
  
}
