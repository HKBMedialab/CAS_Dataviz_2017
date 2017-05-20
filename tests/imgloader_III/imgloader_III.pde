PImage images[]=new PImage[10];       // The source image

int posx;
int posy;
int w=50;

void setup() {
  size(800, 500); 
  for (int i=0; i<10; i++) {
    images[i] = loadImage("images/"+i+".png");  // Load the image
  }
  pixelDensity(2);
}

void draw() {
  posx=0;
  background(255);
  for (int i=0; i<10; i++) {
    image( images[i], posx, posy, w, w);  
    posx+=w;
  }
}