/*
HKB CAS Data Visualization 2017
 Einführung
 Michael Flueckiger
 */

import processing.pdf.*;

//vars
int rectsize=40;
int iterations=300;

int posX;
int posY;

boolean saveFrame=false;


// Setup Funktion, wird einmal aufgerufen
void setup() { 
  size(600, 600);
  background(255);
  noStroke();
}

// Draw Funktion, wird geloopt
void draw() {
  // am Anfang des Frames das PDF beginnen
  if (saveFrame==true) {
    println("saving Frame to export"+frameCount+".pdf");
    beginRecord(PDF, "export" + frameCount + ".pdf");
  }

  background(255);
  colorMode(HSB);
  noStroke();

  posX=0;
  posY=0;
  for (int i=0; i<iterations; i++) {
    fill(random(255), 255, 255, 100);
    rect(posX, posY, rectsize, rectsize);
    posX+=rectsize;
    if (posX>width) {
      posX=0;
      posY+=rectsize;
    }
  }

  // Am Ende des Frames das PDF abschliessen
  if (saveFrame==true) {
    endRecord();
    saveFrame=false;
  }
}

void keyPressed() {
  println(key);
  if (key=='s') {
    saveFrame=true;
  }
}