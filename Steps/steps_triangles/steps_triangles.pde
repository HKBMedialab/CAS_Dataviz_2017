
// Example to process CSV data
// Table syntax in Processing reference: <a href="http://www.processing.org/reference/Table.html" target="_blank">http://www.processing.org/reference/Table.html</a>


Table table;
Table raintable;

int rectsize=4;
color from = color(255, 0, 0);
color to = color(0, 255, 0);

void setup() {
  size(1800, 900);
  table = loadTable("Health Data.csv", "header");


  println(table.getRowCount() + " total rows in table"); 
  int posX=0;
  int posY=0;

  int length=table.getRowCount();



  //get Maximum
  float maxSteps=0;
  float maxflights=0;

  float min =0;
  for (int i = 0; i<table.getRowCount(); i++) { 
    // float value=table.getRow(i).getFloat("Distance (mi)")*1609.34;//to meter;
    float value=table.getRow(i).getFloat("Steps (count)");
    float flights=table.getRow(i).getFloat("Flights Climbed (count)");


    if (value>maxSteps)maxSteps=value;
    if (flights>maxflights)maxflights=flights;
  }
  
  posY=floor(maxflights);

  for (int i = 0; i<table.getRowCount(); i++) { 
    //float value=table.getRow(i).getFloat("Distance (mi)")*1609.34;//to meter
    float value=table.getRow(i).getFloat("Steps (count)");
    float mappedVal=map(value, 0, maxSteps, 0, 100);

    float heightvalue=table.getRow(i).getFloat("Flights Climbed (count)");
    float mappedFlightsVal=map(heightvalue, 0, maxflights, 0, 100);


    float colorlerp=map(value, 0, maxSteps, 0, 1);
    color fillcolor = lerpColor(from, to, colorlerp);

    fill(fillcolor);
    pushMatrix();
    translate(posX,posY);
    triangle(0,0,mappedVal,0,mappedVal,-mappedFlightsVal);
    popMatrix();

    posX=int(posX+mappedVal);
    if (posX>width || i % 365==0 && i>0) {
      posX=0;
      posY+=maxflights;
    }
  }
}