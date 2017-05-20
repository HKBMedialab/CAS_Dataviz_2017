/*
HKB CAS Data Visualization 2017
Color Einführung

HSB Farbraum: 
fill(Winkel im Farbkreis,Sättigung,Helligkeit)

*/


int posX=0;
int posY=0;
int rectsize=5;


void setup() {
  size(600, 600);
  background(20);
  noStroke();
  colorMode(HSB);

  for (int i=0; i<255; i++) {
    float angle=360.0/255.0;
    fill(i, 255, 255);
    pushMatrix();
    translate(width/2,height/2);
    rotate(radians(i*angle));
    rect(150, 0, 100, rectsize);
   popMatrix();
  };
}