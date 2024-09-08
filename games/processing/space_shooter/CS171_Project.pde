//Soundfile import
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer spaceSound;
AudioSample Pew;
AudioSample Crash;

boolean pew;  // variable for triggering shooting sound
boolean crash;  // variable for triggering sound when meteor hits spaceship

// To add a background
PImage background;

//SpaceShip
int x1 = 330;  // Coordinates made for spaceship
int y1 = 300;  // Coordinates made for spaceship
int x2 = 370;  // Coordinates made for spaceship
int y2 = 300;  // Coordinates made for spaceship
int x3 = 350;  // Coordinates made for spaceship
int y3 = 250;  // Coordinates made for spaceship

float dt = 0.005;  // The speed of the meteors

float [] bulletX = new float [0];  // create an array of bullets
float [] bulletY = new float [0];  // create an array of bullets

int score = 0;  // Score variable
int lives = 3;  // Lives variable
int gameover = 0;  // Gameover variable

Meteor m []; // Creating an array of meteors

void setup() 
{
  background = loadImage("SpaceSprite.bmp");  // Load image from the project folder
  size(800, 600);    // Size of the window
  
  m = new Meteor[100];  // Number of meteors to make
  
  for(int i = 0; i < 100; i++)  // Loop to create number of meteors
  {
    m[i] = new Meteor();
  }
  
  //Load a soundfile from the data folder of the sketch and play it back in a loop
   minim = new Minim(this);
   spaceSound = minim.loadFile("SpaceMusic.wav");   // Load the music file into memory
   spaceSound.loop();  // Repeat the sound file when it finishes playing  
   
   Pew = minim.loadSample("Pew.wav");  // Load laser shooting sound
   Crash = minim.loadSample("Crash.wav");  // Load boom sound
   
   pew = false;  // Initial value for triggering sound
   crash = false;  // Initial value for triggering sound
}

void draw()
{
  background(background);  // Background image was used
  
  if (pew == true)  // if statements for triggering sound using boolean
  {
    pew = false;
  }
  if (crash == true)
  {
    crash = false;
  }

  for(int i = 0; i < 100; i++)  // Loop to draw number of meteors into the window
  {
   m[i].movement();  // Movement of every single meteor   
   m[i].draw_meteor();  // Draw every single meteor       
  }
  
  stroke(0); // Frame of the Spaceship
  strokeWeight(1.5);
  fill(255);  // Colour of the Spaceship
  triangle(x1, y1, x2, y2, x3, y3); // The Spaceship
  
    if (x1 <= -10)  // If the ship hits the left side of the window
    {
      x1 = x1 + width;
      x2 = x2 + width;
      x3 = x3 + width;
    }
    if (x1 >= width - 20)  // If the ship hits the right side of the window
    {
      x1 = x1 - width;
      x2 = x2 - width;
      x3 = x3 - width;
    }
    if (y1 <= + 60)  // If the ship hits the top of the window
    {
      y1 = y1 + height;
      y2 = y2 + height;
      y3 = y3 + height;
    }
    if (y1 >= height + 30)  // If the ship hits the bottom of the window
    {
      y1 = y1 - height;
      y2 = y2 - height;
      y3 = y3 - height;
    }
   
BulletShoot();  // Calling a method for shooting projectiles
for (int i = 0; i < 100; i++)  // loop for collision between meteors and spaceship and its bullets
{
  m[i].Collision();
  m[i].shipCollision();
}

  textSize(35);  // Display score information on the screen
  
  fill(255, 0, 0);
  text("Lives:" + lives, 3, 30); 
  
  fill(0,240,0);
  text("Score:" + score, 3, 65); 
  
  if(gameover == 1)  // Wait five seconds before exiting
  {
   delay(5000);
   exit();
  }
  
  if (lives <= 0)   // All lives lost so game over but  
  {                // return to draw one more time to
    gameover = 1; // allow "Game Over to be displayed.
    fill(255, 0, 0);
    textSize(125);
    text("GAME OVER", 40, 330);  // Score of 0 will display game over
    spaceSound.pause();  // Pause the music when player loses all lives
  }
}

class Meteor  // A new class for creating a single meteor object
{
  float mx;  // X value for meteor
  float my;  // Y value for meteor  
  float radius;  // Variable for size of the meteor
  float speed; // Variable for speed of meteor
  
  color col;  // Variable for meteor color

  float sx;  // extra variables for collision detection
  float sy;  // extra variables for collision detection
  float rx;  // extra variables for collision detection
  float ry;  // extra variables for collision detection
  
  Meteor()
  {
   mx = random(0, 1);  // X position for meteor
   my = random(2, 20);  // Y position for meteor
   col = color(random(109, 124), random(110, 129), random(112, 136));  // Randomise the colours for the "col" variable
   radius = 0.05 + random(0.04);  // Randomise the size of the meteor
   speed = random(0.2, 2);  // variable to randomise the speed of meteors
  }
   
  void movement()  // A method for movement of the meteor
  {
   my = my - dt;  // Change in Y value for meteor to go down 
   
   if (my < -0.09)  // If the meteor reaches the bottom of the screen, it is teleported back up so that meteors never stop.
   {
     my = random(3, 20);  // Teleport the meteor up to a random position above the play area 
     score--;  // Reduce the score by one when meteor reaches bottom of the screen
     if (score <= 0)  // To make sure that the score is never in minus values
     {
       score = 0;
     }
   }
  }
 
  void draw_meteor()  // Method to draw the meteor itself
  {
   sx = map(mx, 0, 1, 0, width);  // X coordinates
   sy = map(my, 0, speed, height-1, 0);  // Y coordinates, speed was created above
   rx = map(radius, 0, 1.3, 0, width);  // Set radius to the meteor
   ry = map(radius, 0, 1, 0, height);  // Set radius to the meteor

   fill(col);  // Colour of the meteor, variable "col" used to randomise the colours each time Meteor is drawn.
   ellipse(sx, sy, 2 * rx, 2 * ry);  // Shape of the meteor
  }
  
   void Collision()  // Method for collision between Meteors and ship bullets
   {   
     for (int i = 0; i < bulletX.length; i++)  // Cycle through bullets in an array
     {    
        float sep = sqrt(pow(sx - bulletX[i], 2) + pow(sy - bulletY[i], 2));  // Formula for calculating distance between centers of bullets and meteors
        float rads = 2 * rx;
        if (sep < (rads - 38))  // If collision happens
        {
          my = random(3, 20);  // Teleport the meteor outside the screen in random Y position
          bulletX[i] = -200;  // Teleport the bullet far away from play area
          score = score + 10;  // Increase the score by 10 on hitting a meteor with a bullet
        }  
     }     
  }
  
     void shipCollision()  // Method for collision between Meteors and the Spaceship
   {
       float sep1 = sqrt(pow(sx - x3, 2) + pow(sy - y3, 2));  // Formula for calculating distance between meteor and spaceship
       float sep2 = sqrt(pow(sx - x2, 2) + pow(sy - y2, 2));  // Formula for calculating distance between meteor and spaceship
       float sep3 = sqrt(pow(sx - x1, 2) + pow(sy - y1, 2));  // Formula for calculating distance between meteor and spaceship
       float rads = 2 * rx;
       if ((sep1 < (rads - 38)) || (sep2 < (rads - 38)) || (sep3 < (rads - 38)) )  // If collision happens
       {
         my = random(3, 20);  // teleport the meteor outside the screen in random Y position
         lives--;  //remove 1 life if collision happens
         Crash.trigger();  // trigger a sound
         crash = true;  
       }      
  }
}

// Ship movement
void keyPressed()  // Key press method
{
  if (keyPressed == true)
  {
    if (keyCode == UP)  // if the key pressed is arrow key UP
    {
      y1 = y1 - 15;
      y2 = y2 - 15;
      y3 = y3 - 15;
    }
    if (keyCode == DOWN)  // if the key pressed is arrow key DOWN
    {
      y1 = y1 + 15;
      y2 = y2 + 15;
      y3 = y3 + 15;
    }
    if (keyCode == LEFT)  // if the key pressed is arrow key LEFT
    {
      x1 = x1 - 15;
      x2 = x2 - 15;
      x3 = x3 - 15;
    }
    if (keyCode == RIGHT)  // if the key pressed is arrow key RIGHT
    {
      x1 = x1 + 15;
      x2 = x2 + 15;
      x3 = x3 + 15;
    }
  }
}

void keyReleased()
{
  if (key == ' ') 
    {
      bulletX = append(bulletX, x3);  // Spawn the bullet at ships front 
      bulletY = append(bulletY, y3);  // Spawn the bullet at ships front 
      Pew.trigger();  // trigger a sound
      pew = true;  
    }
}

void BulletShoot()  // Method for shooting bullets
{
  int bWidth = 10;
  int bHeight = 10;

  // Loop through the bullets
  for  (int i = 0; i < bulletX.length; i++)  // Loop to cycle through bullets
  {
    fill (50, 0, 255);
    ellipse(bulletX[i], bulletY[i], bWidth, bHeight);  // Draws bullet
    bulletY[i] = bulletY[i] - (dt + 5);  // Speed of the bullets
    
    if (bulletY[i] < 0)  // if bullet reaches the top of the screen
    {
      bulletX[i] = - 1000;  // teleport the bullet somewhere far outside the play window
    }
  }  
}
