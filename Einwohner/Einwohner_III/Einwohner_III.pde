// Variabeln zur Serialisierung des Codes
int habitantsZuerich=410404;
float flaecheZuerich=91900000;
float rectWidth=sqrt(flaecheZuerich);

int habitantsBasel=175131;
float flaecheBasel=22750000;
float rectWidthBasel=sqrt(flaecheBasel);

// for scaling
float areaScaleFact = 0.03;
float habitantsScaleFact=0.01;
float scaledHabitantsZuerich=habitantsZuerich*habitantsScaleFact;
float zurichWidth=rectWidth*areaScaleFact;

float scaledHabitantsBasel=habitantsBasel*habitantsScaleFact;
float baselWidth=rectWidthBasel*areaScaleFact;



// SETUP 
void setup() {
  // Basiseinstellungen
  size(800, 800);
  background(255);

  //Konsolenausgabe für Debugging
  println(rectWidth);

  noStroke();
  fill(0);
  for (int i=0; i<scaledHabitantsZuerich; i++) {
    ellipse(random(zurichWidth), random(zurichWidth), 5, 5);
  }

  for (int i=0; i<scaledHabitantsBasel; i++) {
    ellipse(zurichWidth+50+random(baselWidth), random(baselWidth), 5, 5);
  }
}

// Animationsloop

void draw() {
}