class Matter
{
  // Coordinates
  PVector position = new PVector();
  
  // Speed of matter
  float speed = 3f;
  
  // Color and scale
  float r, g, b;
  float scale = 5;
  
  // Matter constructor
  Matter()
  {
    // Variables for gaussian distribution
    int standardDeviation = 150;
    int mean = 0;
    
    // Gaussian position
    position.x = randomGaussian() * standardDeviation + mean;
    position.y = randomGaussian() * standardDeviation + mean;
  
    // Random color and scale
    r = random(255);
    g = random(255);
    b = random(255);
    scale = random(5, 45);
    
  }
  
  // Draw the matter
  void render()
  {
    // Set draw settings
    noStroke();
    fill(r, g, b);
    
    // Draw the matter
    circle(position.x, position.y, scale);
    
  }

  // Follow the black hole
  void followBlackHole(PVector target)
  {
    // Get direction towards black hole
    PVector direction = PVector.sub(target, position);
    
    // Move towards black hole
    position = position.add(direction.setMag(speed));

  }
  
}
