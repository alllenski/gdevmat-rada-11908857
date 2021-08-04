class Walker
{
  PVector position = new PVector(-600, 0);
  PVector velocity = new PVector();
  PVector acceleration = new PVector();

  float mass;
  float velocityLimit = 15;
  float scale;
  float r;
  float g;
  float b;
  
  float mew = initialMew;
  float normal = 1;
  float frictionMagnitude = mew * normal;
  
  // Walker constructor
  Walker(int index)
  {
    // Assign values
    mass = 10 - index;
    scale = mass * 8;
    r = random(255);
    g = random(255);
    b = random(255);
    
    // Position top to bottom
    position.y = (Window.top - ((Window.windowHeight / 8) * (index + 1))) + ((Window.windowHeight / 8) / 2);
    
  }
  
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  void update()
  {
    float normal = 1;
    float frictionMagnitude = this.mew * this.normal;
    PVector friction = this.velocity.copy();
    
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    this.applyForce(friction);

    // Increase velocity by accelerating
    this.velocity.add(acceleration);
    
    // Limit velocity
    this.velocity.limit(velocityLimit);
    
    // Move walker with velocity
    this.position.add(velocity);
    
    // Reset acceleration
    this.acceleration.mult(0);
    
    checkMidPoint();
    
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
  void checkMidPoint()
  {
    if (this.position.x + this.scale / 2 > 0)
    {
      this.mew = midPointMew;
    }
    
  }
  
}
