// Example to process CSV data
// Table syntax in Processing reference: <a href="http://www.processing.org/reference/Table.html" target="_blank">http://www.processing.org/reference/Table.html</a>
import java.text.SimpleDateFormat;
import java.util.Date;

Table table;
int rectsize=10;
color from = color(135, 206, 250);
color to = color(139, 69, 19);

color z = color(0, 255, 0);
color b = color(0, 0, 255);

int counter;

int shiftX=rectsize*25;

void setup() {



  size(800, 1000);

  int daybefore=1;
  int day=1;
  int month=0;
  int monthbefore=0;

  table = loadTable("pm10.csv", "header");
  println(table.getRowCount() + " total rows in table"); 
  int posX=0;
  int posY=0;
  

  
  for (TableRow row : table.rows()) { //ABK für  for (int i = 0; i < zeilen.length; i++ ){int wert = zeilen[i];}
    String datum = row.getString("Datum");
    float value=row.getFloat("Zurich");
    float colorlerp=map(value, 0, 50, 0, 1);
    color fillcolor = lerpColor(from, to, colorlerp);
    fill(fillcolor);
    noStroke();
    rect(posX, posY, rectsize, rectsize);
    
    
    
    counter++;
    posX=posX+rectsize;
    Date pdate = new Date();
    try {
      pdate = new SimpleDateFormat("dd.MM.yyyy hh:mm").parse(datum);
      day=pdate.getDate();
      month=pdate.getMonth();
      
      if (day!=daybefore) {
        posX=0;
        posY+=rectsize;
       
      }

      if (month!=monthbefore) {
       // return;
        posX=0;
        posY+=rectsize;
        println(month+" "+monthbefore);
      }
    }
    catch (Exception e) {
      println(e);
    }

    daybefore=day;
    monthbefore=month;
  }


 

}