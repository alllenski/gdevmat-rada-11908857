class Walker
{
  PVector position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
  PVector velocity = new PVector();
  PVector acceleration = new PVector();

  float mass;
  float velocityLimit = 15;
  float scale;
  float r;
  float g;
  float b;
  
  float gravitationalConstant = 1;
  
  // Walker constructor
  Walker(int index)
  {
    // Assign values
    mass = 10 - index;
    scale = mass * 8;
    r = random(255);
    g = random(255);
    b = random(255);
    
  }
  
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  void update()
  {
    // Increase velocity by accelerating
    this.velocity.add(acceleration);
    
    // Limit velocity
    this.velocity.limit(velocityLimit);
    
    // Move walker with velocity
    this.position.add(velocity);
    
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
  
  // Check and bounce
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

  PVector calculateAttraction(Walker walker)
  {
     PVector force = PVector.sub(this.position, walker.position);
     float distance = force.mag();
     force.normalize();
     
     distance = constrain(distance, 5, 25);
     
     float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
     force.mult(strength);
     return force;
  }
}
