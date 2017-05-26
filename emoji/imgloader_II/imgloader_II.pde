// Load image
PImage img;       // The source image
PImage img1;       // The source image
PImage img2;       // The source image

int posx;
int posy;
int w=50;

void setup() {
  size(800, 500); 
  img = loadImage("images/0.png");  // Load the image
  img1 = loadImage("images/1.png");  // Load the image
  img2 = loadImage("images/2.png");  // Load the image

  pixelDensity(2);
}

void draw() {
  background(255);
  image(img, posx, posy, w, w);
  image(img1, posx, posy, w, w);  
  image(img2, posx, posy, w, w);
}