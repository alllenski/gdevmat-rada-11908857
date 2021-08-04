class Walker
{
  PVector position = new PVector(0, 300);
  PVector velocity = new PVector();
  PVector acceleration = new PVector();

  float mass;
  float velocityLimit = 15;
  float scale;
  float r;
  float g;
  float b;
  
  // Walker constructor
  Walker(int index)
  {
    // Assign values
    mass = random(10);
    scale = this.mass * 10;
    r = random(255);
    g = random(255);
    b = random(255);
    
    // Position right to left
    position.x = (Window.right - ((Window.windowWidth / 10) * (index + 1))) + ((Window.windowWidth / 10) / 2);
  
}
  
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  void update()
  {
    // Increase velocity by accelerating
    this.velocity.add(this.acceleration);
    
    // Limit velocity
    this.velocity.limit(this.velocityLimit);
    
    // Move walker with velocity
    this.position.add(this.velocity);
    
    // Reset acceleration
    this.acceleration.mult(0);
    
    checkAndBounce();
    
  }
  
  // Draw the walker
  void render()
  {
    // Set draw settings
    noStroke();
    fill(r, g, b);
    
    // Draw the walker
    circle(position.x, position.y, scale);
    
  }

  // Check and slow down
  void checkAndBounce()
  {
    if (this.position.x + this.scale / 2 > Window.right)
    {
      this.velocity.x *= -1;
      this.position.x += this.velocity.x;
    }
    else if (this.position.x - this.scale / 2 < Window.left)
    {
      this.velocity.x *= -1;
      this.position.x += this.velocity.x;
    }
    if (this.position.y + this.scale / 2 > Window.top)
    {
      this.velocity.y *= -1; 
      this.position.y += this.velocity.y;
    }
    else if (this.position.y - this.scale / 2 < Window.bottom)
    {
      this.velocity.y *= -1; 
      this.position.y += this.velocity.y;
    }
    
  }
  
}
