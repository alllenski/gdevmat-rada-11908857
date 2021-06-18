class BlackHole
{
  // Random position within the window
  PVector position = new PVector(random(Window.left, Window.right),
      random(Window.bottom, Window.top));
  float scale = 50;
  
  // Draw the walker
  void render()
  {
    // Set draw settings
    noStroke();
    fill(255);
    
    // Draw the black hole
    circle(position.x, position.y, scale);
    
  }

  // Follow the mouse
  void followMouse()
  {
    // Get direction towards mouse
    PVector direction = PVector.sub(mousePosition(), position);
    
    // Move towards mouse
    position = position.add(direction);

  }
  
}
