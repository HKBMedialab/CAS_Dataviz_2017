// Load image
PImage img;       // The source image

int posx;
int posy;
int w=50;

void setup(){
 size(800, 500); 
  img = loadImage("images/0.png");  // Load the image
  pixelDensity(2);
}

void draw(){
  background(255);
  image(img,posx,posy,w,w);
}