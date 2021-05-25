class Walker
{
  float x;
  float y;
  float stepDistance = 5;
  
  void render()
  {
    circle(x, y, 30);
  }
  
  void randomWalk()
  {
    int rng = int(random(5));
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
      
}
