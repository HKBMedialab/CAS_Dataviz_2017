/*
HKB CAS Data Visualization 2017
Einführung
Michael Flueckiger
*/

//vars
int rectsize=40;
int iterations=800;

void setup() {
  size(600, 600);
  background(255);
  colorMode(HSB);
  noStroke();
  for (int i=0; i<iterations; i++) {
    fill(random(255), 255, 255, 100);
    rect(random(width-rectsize), random(height-rectsize), rectsize, rectsize);
  }
}