float [] xPositions = new float[10];
float [] yPositions = new float[10];


void setup() {
  size(500, 500);
  for (int i=0; i<xPositions.length; i++) {
    xPositions[i]=random(width);
    yPositions[i]=random(height);
  }
  printArray(xPositions);
}

void draw() {
  for (int i=0; i<xPositions.length; i++) {
    rect(xPositions[i], yPositions[i], 10, 10);
  }
}