Table table;

int ellipsesize=2;
// color lerp
color from = color(255, 0, 0);
color to = color(0, 255, 0);

int spacer=80;
//should print?
boolean record=false;
//offscreen buffer
PGraphics p;
//font
PFont mono;

import processing.pdf.*;          // Import PDF code

void setup() {
  size(1900, 800);
   pixelDensity(2); //retina support
   smooth();
  if (record) p=createGraphics(1900, 2500);
  background(255);

  // font
  mono = loadFont("Monospaced-30.vlw");
  textFont(mono, 10);
  textSize(10);

  table = loadTable("health.csv", "header");


  println(table.getRowCount() + " total rows in table"); 

  //spiralposition
  float posX=spacer;
  float posY=spacer;

  int length=table.getRowCount();


  //get Maximum
  int max=0;
  int min =0;
  for (int i = 0; i<table.getRowCount(); i++) { 
    int value=table.getRow(i).getInt("Steps");
    if (value>max)max=value;
  }
  println(max);
  fill(0, 0, 255, 255);
  //beginRecord(PDF, "line.pdf");     // Start writing to PDF
  noStroke();

  colorMode(HSB);
  if (record) {
    p.beginDraw();
    p.background(255);
    p.colorMode(HSB);
  }

  for (int i = 0; i<table.getRowCount(); i++) { 

    int value=table.getRow(i).getInt("Steps");
    String date=table.getRow(i).getString("Start");
    String[] datstring = split(date, '-');

    float rad = 0;   // Radius der Kreisbahn
    float angle = 0; // aktueller Rotationswinkel
    float x=0;
    float y=0;



    for (int k=0; k<value/5; k++)
    {
      // Verschieben des Rotationswinkels
      angle += 0.02;
      // Vergrößern des Radius
      rad += 0.02;

      // Berechnung der aktuellen Position
      x= posX + cos (angle) * rad;
      y = posY + sin (angle) * rad;

      fill(angle+100, 255, 255, 200);
      if (record) {
        p.fill(angle+100, 255, 255, 200);
        p.noStroke();
      }

      ellipse (x, y, ellipsesize, ellipsesize);
  
      if (record)p.ellipse (x, y, ellipsesize, ellipsesize);

      /*
      fill(100);
      text(datstring[0]+" "+datstring[1], posX-20, posY+0.3*spacer);

      if (record) {
        p.fill(100);
        p.text(datstring[0]+" "+datstring[1], posX-20, posY+0.3*spacer);
      }*/
    }

    posX+=spacer;
    if (posX>width-spacer) {
      posX=spacer;
      posY+=spacer;
    };
  }
  if (record) p.save("test");
  // endRecord();                      // Stop writing to PDF
}