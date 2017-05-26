int einwohner_zuerich=410404;

// SETUP 
void setup() {
  // Basiseinstellungen
  size(800, 800);
  background(255);

  noStroke();
  fill(0);
  for (int i=0; i<einwohner_zuerich/10; i++) {
    ellipse(random(width), random(height), 5, 5);
  }
}

// Animationsloop

void draw() {
}