
// Quiz 1
/*
UP DOWN to change frequency
LEFT RIGHT to change amplitude
W S to change wave speed
*/

// Global variables

float amplitude = 5; // More amplitude higher waves
float frequency = 60; // More frequency more waves
float speed = 1; // Speed of the sinewave
float time = 0; // Passage of time


void setup()
{
  // Setup canvas
  size(600, 600, P3D);
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}


void draw()
{
  background(0);

  // Handle input if key pressed
  if (keyPressed) { handleInput(); }

  // Draw stuff
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawSineWave();
  
  // Increment time with speed factor for moving sine wave
  time += 0.1f * speed;
    
}


void drawCartesianPlane()
{
  // Set draw settings
  strokeWeight(1);
  color white = color(255);
  fill(white);
  stroke(white);
  
  // Draw horizontal and vertical axis
  line(-width / 2, 0, width / 2, 0);
  line(0, -height / 2, 0 , height / 2);
  
  // Draw small lines on each axis
  for (int i = -width / 2; i <= width / 2; i = i + 25) {
    line(-5, i , 5, i);
    line(i, -5, i, 5);
    
  }
  
}


void drawLinearFunction()
{
  // Set draw settings
  color purple = color(128, 0, 128);
  fill(purple);
  noStroke();
  
  // Graph the function: -5x + 30
  for (float i = -100; i <= 100; i += 0.05f) {
    circle(i, (-5 * i) + 30, 2);
    
  }
  
}


void drawQuadraticFunction()
{
  // Set draw settings
  color yellow = color(255, 255, 0);
  fill(yellow);
  noStroke();
  
  // Graph the function: x^2 - 15x - 3
  for (float i = -100; i <= 100; i += 0.05f) {
    circle(i, (i * i) - (i * 15) - 3, 2);
    
  }
  
}


void drawSineWave()
{
  // Set draw settings
  color white = color(255);
  fill(white);
  noStroke();
  
  // Get time to move the wave per frame
  float offset = time;
  
  // Graph a sinewave
  for (float i = -width/frequency; i <= width/frequency; i += 0.01f) {
    // The x value is influenced by frequency which affects the wavelength
    // The y value is influenced by the offset for it to move and the amplitude which affects the height
    circle(i * frequency, (float)Math.sin(offset) * amplitude, 2);
    offset += 0.01f; // Change offset so that the line becomes a wave
    
  }
  
}


void handleInput()
{  
  // If key pressed is a coded key
  if (key == CODED)
  {
    // Increase frequency by pressing up and decrease by pressing down to a minimum of 1 (else it crashes / freezes)
    // Increase amplitude by pressing right and decrease by pressing left
    if (keyCode == UP)
    {
      frequency++;
      
    } 
    if (keyCode == DOWN)
    {
      frequency = max(frequency - 1, 1);
      
    }
    if (keyCode == RIGHT)
    {
      amplitude++;
      
    }
    if (keyCode == LEFT)
    {
      amplitude--;
      
    }
   
  }
  else // If key pressed isn't a coded key
  {
    // Increase speed by pressing w and decrease by pressing s
    if (key == 'w' || key == 'W')
    {
      speed = speed + 0.1;
      
    }
    if (key == 's' || key == 'S')
    {
      speed = speed - 0.1;
      
    }
    
  }
  
}
 
 
