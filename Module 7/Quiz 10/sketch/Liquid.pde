class Liquid
{
  float x, y;
  float horizon, depth;
  float cd;
  
  Liquid(float x, float y, float horizon, float depth, float cd)
  {
   this.x = x;
   this.y = y;
   this.horizon = horizon;
   this.depth = depth;
   this.cd = cd;
  }
  
  void render()
  {
    noStroke();
    fill(28, 120, 186);
    beginShape();
    vertex(x - horizon, y, 0);
    vertex(x + horizon, y, 0);
    vertex(x + horizon, y + depth, 0);
    vertex(x - horizon, y + depth, 0);
    endShape();
  }
  
  boolean isCollidingWith(Walker walker)
  {
    PVector position = walker.position;
    return position.x > this.x - this.horizon &&
        position.x < this.x + this.horizon &&
        position.y < this.y;
  }
  
  PVector calculateDragForce(Walker walker)
  {
    float speed = walker.velocity.mag();
    float dragMagnitude = this.cd * speed * speed;
    
    PVector dragForce = walker.velocity.copy().mult(-1);
    
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }

}
