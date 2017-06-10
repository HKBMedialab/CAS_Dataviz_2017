import processing.pdf.*;


// Variabeln zur Serialisierung des Codes

// for scaling
float areaScaleFact = 0.05;
float habitantsScaleFact=0.05;

Table table;
PFont mono;


boolean saveFrame=false;



// SETUP 
void setup() {
  // Basiseinstellungen
  size(1600, 800);
  background(255);

  beginRecord(PDF, "export" + frameCount + ".pdf");


  //Daten laden
  table = loadTable("SchweizerStaedte.csv", "header");

  //Konsolenausgabe für Debugging
  println(table.getRowCount() + " total rows in table"); 


  // font
  mono = loadFont("Monospaced-30.vlw");
  textFont(mono, 30);


  //Positionsvariabeln
  int gutter=20;
  int posX=gutter;
  int posY=gutter;

  noStroke();


  for (TableRow row : table.rows()) { //ABK für  for (int i = 0; i < zeilen.length; i++ ){int wert = zeilen[i];}
    String city=row.getString("Stadt");
    float area=row.getFloat("Flaeche");
    float rectSide=sqrt(area)*areaScaleFact;

    noFill();
    rect(posX, posY, rectSide, rectSide);

    fill(0, 100);
    float habitants = row.getFloat("Einwohner");
    float scaledHabitants=habitants*habitantsScaleFact;
    println(habitants);

    for (int i=0; i<scaledHabitants; i++) {
      ellipse(posX+random(rectSide), posY+random(rectSide), 5, 5);
    }

    fill(0);
    textSize(20);
    text(city, posX, posY+rectSide+textAscent()+gutter);
    posX+=rectSide+gutter;
  }

  endRecord();
}

// Animationsloop

void draw() {
}