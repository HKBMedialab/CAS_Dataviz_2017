Table table;
int scale=100;
int rectsize=8;


void setup() {
  background(255);

  size(1200, 1000);
  table = loadTable("wohnungen.csv", "header");
  println(table.getRowCount() + " total rows in table"); 

  colorMode(HSB);
  float hueStep=255/table.getRowCount();

  noStroke();
  pushMatrix();
  translate(100, 100);
  float hue=0;
  for (int i=0; i<8; i++) {
    fill(hue, 255, 255, 100);
    text(i+1+" Zimmer", 0, i*15);
    hue+=255/8;
  }
  popMatrix();


  float rotStep=(2*PI)/table.getRowCount();

  int columns=table.getColumnCount();

  println(columns);

  for (int i = 0; i<table.getRowCount(); i++) { //ABK für  for (int i = 0; i < zeilen.length; i++ ){int wert = zeilen[i];}
   
    TableRow row = table.getRow(i);
    noStroke();

    for (int k=2; k<columns; k++) {
      fill((k-2)*255/8, 255, 255, 100);
      int val=row.getInt(k);
      pushMatrix();
      translate(width/2, height/2);
      rotate(i*rotStep);
      rect(val/scale, 0, rectsize, rectsize);
      popMatrix();
    };

    pushMatrix();
    translate(width/2, height/2);
    rotate(i*rotStep);
    stroke(255, 100, 100, 30);
    line(50, 0, width/2-80, 0);
    popMatrix();
  }
}