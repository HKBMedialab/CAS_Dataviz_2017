// Example to process CSV data
// Table syntax in Processing reference: <a href="http://www.processing.org/reference/Table.html" target="_blank">http://www.processing.org/reference/Table.html</a>


Table table;
int ellipseSize=10;
color from = color(135, 206, 250);
color to = color(139, 69, 19);

color z = color(0, 255, 0);
color b = color(0, 0, 255);

int counter;

void setup() {
  //Settings
  size(800, 800);
  background(255);
  noStroke();
  fill(0, 0, 255, 100);


  // Load data
  table = loadTable("regen_2016.csv", "header");
  println(table.getRowCount() + " total rows in table"); 


  // Keep track of  Position
  float posX=0;
  float posY=0;

  for (TableRow row : table.rows()) { //ABK für  for (int i = 0; i < zeilen.length; i++ ){int wert = zeilen[i];}
    //Get data in row
    float value=row.getFloat("Bern");

    // draw one dot / mm
    for (int i = 0; i < value; i++ ) {
      ellipse(posX, random(height), ellipseSize, ellipseSize);
    }

    posX=posX+ellipseSize;
  }
}