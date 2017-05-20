/*
HKB CAS Data Visualization 2017
Einführung
Michael Flueckiger
*/


void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
}

void draw() {
 fill(255,100,100,10);
   //jedes Mal, wenn das Programm wieder neu in den Drawloop eintritt, 
  //wird die Position des Kreises neu gesetzt:
 
  ellipse(mouseX, mouseY, 30, 30);
}