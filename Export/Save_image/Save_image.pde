
//offscreen buffer
PGraphics screenBuffer;


// SETUP 
void setup() {
  // Basiseinstellungen
  size(1600, 800);
  background(255);
  screenBuffer=createGraphics(1900, 2500);
  // in den Buffer zeichnen
  screenBuffer.beginDraw();
  screenBuffer.background(255);
  screenBuffer.fill(random(255), random(255), random(255));
  screenBuffer.rect(width/2, height/2, 30, 30);
  screenBuffer.endDraw();
  screenBuffer.save("exports/export" + frameCount + ".tiff");
  // Buffer zeichnen
  image(screenBuffer, 0, 0);
}