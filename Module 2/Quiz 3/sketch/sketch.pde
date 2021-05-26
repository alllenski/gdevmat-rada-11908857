
// Quiz 3

// Keep track of frame count
int frame = 0;

void setup()
{
  // Setup canvas
  size(600, 600, P3D);
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
  
}

void draw()
{
  // Clear background every 300 frames
  if (frame % 300 == 0) { background(0); }
  frame++;
  
  // Setup coordinates
  int standardDeviation = 100;  
  int mean = 0;
  float x = randomGaussian() * standardDeviation + mean;
  float y = random(-width / 2, width / 2);
  
  // Setup circle size
  standardDeviation = 25;
  mean = 30;
  float scale = randomGaussian() * standardDeviation + mean;
  
  // Draw the circle
  noStroke();
  fill(random(255), random(255), random(255), random(90) + 10);
  circle(x, y, scale);
  
}
