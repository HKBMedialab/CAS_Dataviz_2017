import processing.pdf.*;


// Variabeln zur Serialisierung des Codes

// for scaling
float areaScaleFact = 0.05;
float habitantsScaleFact=0.05;

Table table;
PFont mono;

//offscreen buffer
PGraphics screenBuffer;

// SETUP 
void setup() {
  // Basiseinstellungen
  size(1600, 800);

  screenBuffer=createGraphics(1600, 800);
  screenBuffer.beginDraw();
  screenBuffer.background(255);

  background(255);


  //Daten laden
  table = loadTable("SchweizerStaedte.csv", "header");

  //Konsolenausgabe für Debugging
  println(table.getRowCount() + " total rows in table"); 


  // font
  mono = loadFont("Monospaced-30.vlw");
  screenBuffer.textFont(mono, 30);

  //Positionsvariabeln
  int gutter=20;
  int posX=gutter;
  int posY=gutter;

  //noStroke();
  screenBuffer.noStroke();


  for (TableRow row : table.rows()) { //ABK für  for (int i = 0; i < zeilen.length; i++ ){int wert = zeilen[i];}
    String city=row.getString("Stadt");
    float area=row.getFloat("Flaeche");
    float rectSide=sqrt(area)*areaScaleFact;

    // noFill();
    screenBuffer.noFill();
    //rect(posX, posY, rectSide, rectSide);
    // Wir müssen nun alles auch in den screenbuffer zeichnen
    screenBuffer.rect(posX, posY, rectSide, rectSide);

    screenBuffer.fill(0, 100);
    float habitants = row.getFloat("Einwohner");
    float scaledHabitants=habitants*habitantsScaleFact;
    println(habitants);

    for (int i=0; i<scaledHabitants; i++) {
      //ellipse(posX+random(rectSide), posY+random(rectSide), 5, 5);
      screenBuffer.ellipse(posX+random(rectSide), posY+random(rectSide), 5, 5);
    }

    /*fill(0);
     textSize(20);
     text(city, posX, posY+rectSide+textAscent()+gutter);*/

    screenBuffer.fill(0);
    screenBuffer.textSize(20);
    screenBuffer.text(city, posX, posY+rectSide+screenBuffer.textAscent()+gutter);


    posX+=rectSide+gutter;
  }
  screenBuffer.endDraw();

  screenBuffer.save("Export");
}

// Animationsloop

void draw() {
    image(screenBuffer, 0, 0);

}