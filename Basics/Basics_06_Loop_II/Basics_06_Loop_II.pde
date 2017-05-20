/*
HKB CAS Data Visualization 2017
Einführung
Michael Flueckiger
*/

//vars
int rectsize=40;
int iterations=800;

int posX;
int posY;

void setup() {
  size(600, 600);
  background(255);
  colorMode(HSB);
  noStroke();
  for (int i=0; i<iterations; i++) {
    fill(random(255), 255, 255, 100);
    rect(posX, posY, rectsize, rectsize);
    posX+=rectsize;
    if (posX>width) {
      posX=0;
      posY+=rectsize;
    }
  }
}