//http://www.bafu.admin.ch/luft/luftbelastung/blick_zurueck/datenabfrage/index.html?lang=de

PImage images[]=new PImage[10];       // The source image
Table table;

int posx;
int posy;
int w=50;
int rectsize=50;

color from = color(135, 206, 250);
color to = color(139, 69, 19);


void setup() {
  size(1000, 800); 
  background(200,200,255);
  pixelDensity(2);

  // load images
  for (int i=0; i<10; i++) {
    images[i] = loadImage("images/"+i+".png");  // Load the image
  }
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
    int mapped_input=int(map(value, 0, 70, 0, 9));
    if(mapped_input>9){
          println(value+" "+mapped_input);

      mapped_input=9;
    }
image(images[mapped_input],posx, posy, rectsize, rectsize);
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