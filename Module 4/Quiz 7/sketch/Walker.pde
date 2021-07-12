class Walker
{
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();

  float velocityLimit = 15;
  float scale;
  
  // Walker constructor
  Walker()
  {
    // Variables for gaussian distribution
    int standardDeviation = 150;
    int mean = 0;
    
    // Gaussian position
    position.x = randomGaussian() * standardDeviation + mean;
    position.y = randomGaussian() * standardDeviation + mean;
  
    // Random scale
    scale = random(5, 45);
    
  }
  
  void update()
  {
    // Set acceleration speed
    acceleration.mult(0.2); 
    
    // Increase velocity by accelerating
    velocity.add(acceleration);
    
    // Limit velocity
    velocity.limit(velocityLimit);
    
    // Move walker with velocity
    position.add(velocity);
    
  }
  
  // Draw the walker
  void render()
  {
    // Set draw settings
    noStroke();
    fill(255);
    
    // Draw the matter
    circle(position.x, position.y, scale);
    
  }

  void getDirection(PVector target)
  {
    // Get direction towards target
    acceleration = PVector.sub(target, position);
    
    // Normalize direction
    acceleration.normalize();

  }
  
}
