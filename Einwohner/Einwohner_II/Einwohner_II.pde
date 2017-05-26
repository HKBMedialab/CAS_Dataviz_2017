int einwohnerZuerich=410404;
float flaecheZuerich=91900000;
float rectWidth=sqrt(flaecheZuerich);

// for scaling
float areaScaleFact = 0.05;
float zurichWidth=rectWidth*areaScaleFact;


float habitantsScaleFact=0.1;


// SETUP 
void setup() {
  // Basiseinstellungen
  size(800, 800);
  background(255);

  //Konsolenausgabe für Debugging
  println(rectWidth);

  noStroke();
  fill(0);
  for (int i=0; i<einwohnerZuerich/10; i++) {
   // ellipse(random(width), random(height), 5, 5);
  }
  
  fill(255,0,0);
  
 // rect(0,0,sqrt(flaeche_zuerich)/50,sqrt(flaeche_zuerich)/50);
  rect(0,0,zurichWidth,zurichWidth);

}

// Animationsloop

void draw() {
}