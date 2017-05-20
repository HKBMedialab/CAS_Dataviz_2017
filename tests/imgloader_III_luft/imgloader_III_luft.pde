//http://www.bafu.admin.ch/luft/luftbelastung/blick_zurueck/datenabfrage/index.html?lang=de

Table table;

int posx;
int posy;
int w=50;
int rectsize=10;

color from = color(135, 206, 250);
color to = color(139, 69, 19);


void setup() {
  size(800, 500); 
  pixelDensity(2);
  // load data
  table = loadTable("pm10.csv", "header");
  // check output
  println(table.getRowCount() + " total rows in table");
  
    // positions
  int posx=0;
  int posy=0;
    //Loop through dataset
  for (TableRow row : table.rows()) { //ABK für  for (int i = 0; i < zeilen.length; i++ ){int wert = zeilen[i];}
    int value=row.getInt("Zurich");
    //map data
     float lerpamount=map(value, 0, 50, 0, 1);
    //get fillcolor
    color fillcolor = lerpColor(from, to, lerpamount);
    fill(fillcolor);
    rect(posx, posy, rectsize, rectsize);
    posx=posx+rectsize;
    // check linebreak
    if (posx>width) {
      posx=0;
      posy+=rectsize;
    }
  }
}
  


void draw() {
 
}