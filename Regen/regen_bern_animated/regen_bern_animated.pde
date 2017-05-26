// Example to process CSV data
// Table syntax in Processing reference: <a href="http://www.processing.org/reference/Table.html" target="_blank">http://www.processing.org/reference/Table.html</a>
import java.text.SimpleDateFormat;
import java.util.Date;

Table table;
float rectsize=90;
float ellipsesize=20;
color from = color(135, 206, 250);
color to = color(139, 69, 19);

color z = color(0, 255, 0);
color b = color(0, 0, 255);

int counter;


void setup() {
  size(1600, 980);
  background(255);
  table = loadTable("regen_2016.csv", "header");
  ellipsesize=width/table.getRowCount();
  println(table.getRowCount() + " total rows in table"); 

}

void draw(){
//background(255);

fill(255,30);
rect(0,0,width,height);



  float posX=0;
  float posY=0;
  
  
  
  for (TableRow row : table.rows()) { //ABK für  for (int i = 0; i < zeilen.length; i++ ){int wert = zeilen[i];}
    String datum = row.getString("Datum");
    float value=row.getFloat("Bern");
  noStroke();

    fill(0, 0, random(200,255), random(100,255));
    for (int i = 0; i < value; i++ ) {
      for (int k=0; k<10; k++) {
        float size=random(ellipsesize);
        ellipse(random(posX,posX+rectsize), random(posY,posY+rectsize), size,size);
      }
    }


   // stroke(0);
    noFill();
     //rect(posX, posY, rectsize, rectsize);
     posX=posX+rectsize;
     if(posX>width){
     posX=0;
     posY+=rectsize;

     };
     
     
  }

}