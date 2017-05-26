//http://www.bafu.admin.ch/luft/luftbelastung/blick_zurueck/datenabfrage/index.html?lang=de

PImage images[]=new PImage[10];       // The source image
Table table;

int posx;
int posy;
int w=50;
int rectsize=200;



float maxPollution=0;
int rowCounter=0;
int maxRows=0;

void setup() {
  size(200, 200); 
  background(200, 200, 255);
  pixelDensity(2);
  frameRate(20);
  // load images
  for (int i=0; i<10; i++) {
    images[i] = loadImage("images/"+i+".png");  // Load the image
  }
  // load data
  table = loadTable("pm10_basel.csv", "header");
  // check output
  println(table.getRowCount() + " total rows in table");
  maxRows=table.getRowCount();
  //Loop through dataset
  for (TableRow row : table.rows()) { //ABK für  for (int i = 0; i < zeilen.length; i++ ){int wert = zeilen[i];}
    float value=row.getFloat("PM10");
    //get max
    if (value>maxPollution)maxPollution=value;
  }
  println(maxPollution);
}



void draw() {

  background(255);
  TableRow row = table.getRow(rowCounter);
  float value=row.getFloat("PM10");
  String datum = row.getString("Datum");

  int mapped_input=int(map(value, 0, maxPollution, 0, 9));
  

  image(images[mapped_input], posx, posy, rectsize, rectsize);
  fill(0);
  text(datum, 10, height-10); 
  
  rowCounter++;
  if (rowCounter>=maxRows)rowCounter=0;
}