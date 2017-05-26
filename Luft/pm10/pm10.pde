// Example to process CSV data
// Table syntax in Processing reference: <a href="http://www.processing.org/reference/Table.html" target="_blank">http://www.processing.org/reference/Table.html</a>

//http://www.bafu.admin.ch/luft/luftbelastung/blick_zurueck/datenabfrage/index.html?lang=de

Table table;
int rectsize=10;
color from = color(135, 206, 250);
color to = color(139, 69, 19);

void setup() {
  // Settings
  size(800, 800);
  noStroke();
 
  // load data
  table = loadTable("pm10.csv", "header");
  // check output
  println(table.getRowCount() + " total rows in table"); 

  // positions
  int posX=0;
  int posY=0;
  //Loop through dataset
  for (TableRow row : table.rows()) { //ABK für  for (int i = 0; i < zeilen.length; i++ ){int wert = zeilen[i];}
    int value=row.getInt("Zurich");
    //map data
    float lerpamount=map(value, 0, 50, 0, 1);
    //get fillcolor
    color fillcolor = lerpColor(from, to, lerpamount);
    fill(fillcolor);
    rect(posX, posY, rectsize, rectsize);
    posX=posX+rectsize;
    // check linebreak
    if (posX>width) {
      posX=0;
      posY+=rectsize;
    }
  }
}