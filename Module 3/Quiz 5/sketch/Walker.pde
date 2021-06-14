class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector(5, 8);
  float scale = 30;
  
  // Draw the walker
  void render()
  {
    // Set draw settings
    noStroke();
    fill(0, 255);
    
    // Draw the walker
    circle(position.x, position.y, scale);
    
  }

  // Walk randomly
  void randomWalk()
  {
    // Pick a direction to walk (8-directions)
    int rng = int(random(9));
    if (rng == 0)
    {
      position.y -= speed.y;
    }
    else if (rng == 1)
    {
      position.y += speed.y; 
    }
    else if (rng == 2)
    {
      position.x += speed.x;
    }
    else if (rng == 3)
    {
      position.x -= speed.x; 
    }
    else if (rng == 4)
    {
      position.sub(speed);
    }
    else if (rng == 5)
    {
      position.x -= speed.x; 
      position.y += speed.y;
    }
    else if (rng == 6)
    {
      position.x += speed.x;
      position.y -= speed.y;
    }
    else if (rng == 7)
    {
      position.add(speed);
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
    float rng = random(10);
    if (rng < 2)
    {
      position.y -= speed.y;
    }
    else if (rng < 4)
    {
      position.y += speed.y;
    }
    else if (rng < 8)
    {
      position.x += speed.x;
    }
    else if (rng < 10)
    {
      position.x -= speed.x; 
    }

  }
  
  // Move and bounce
  void moveAndBounce()
  {
    position.x += speed.x;
    position.y += speed.y;
    
    if ((position.x + scale / 2 > Window.right) || (position.x - scale / 2< Window.left))
    {
      speed.x *= -1;
    }
    if ((position.y + scale / 2 > Window.top) || (position.y - scale / 2< Window.bottom))
    {
      speed.y *= -1; 
    }
    
  }
  
}
