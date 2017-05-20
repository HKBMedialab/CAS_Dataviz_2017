/*
HKB CAS Data Visualization 2017
Einführung
Michael Flueckiger
*/

//vars
int rectsize=20;
int iterations=800;

int posX=rectsize/2;
int posY=rectsize/2;

void setup() {
  size(600, 600);
  background(255);
  colorMode(HSB);
  rectMode(CENTER);
  noStroke();
  for (int i=0; i<iterations; i++) {
    pushMatrix();
    translate(posX,posY);
    rotate(i*(2*PI/iterations));
    fill(random(255), 255, 255, 100);
    rect(0, 0, rectsize, rectsize);
    posX+=rectsize;
    if (posX>width) {
      posX=rectsize/2;
      posY+=rectsize;
    }
    popMatrix();
  }
}