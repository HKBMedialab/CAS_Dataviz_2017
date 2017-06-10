// Variable für den Array / die Liste definieren und entsprechend viel Speicher reservieren
int [] xPositions = new int[3];

// alternative Syntax
int [] yPositions = {20,200,400};

void setup() {
  size(500, 500);
  // Werte dem Array zuweisen
  xPositions[0]=10;
  xPositions[1]=100;
  xPositions[2]=200;
}

void draw() {
  rect(xPositions[0], yPositions[0], 10, 10);
  rect(xPositions[1], yPositions[1], 10, 10);
  rect(xPositions[2], yPositions[2], 10, 10);
}