
// Example to process CSV data
// Table syntax in Processing reference: <a href="http://www.processing.org/reference/Table.html" target="_blank">http://www.processing.org/reference/Table.html</a>

//Vars
Table table;


void setup() {
  size(900, 900);
  pixelDensity(2); //retina support

  background(255);
  table = loadTable("health.csv", "header");
  //check output
  println(table.getRowCount() + " total rows in table"); 
 

  //get Maximum to map circles
  int max=0;
  int min =0;
  for (int i = 0; i<table.getRowCount(); i++) { 
    int value=table.getRow(i).getInt("Steps");
    if (value>max)max=value;
  }
  println("Max "+max);
 
  noFill();
  stroke(0, 0, 255, 50);
  // loop through data
  for (int i = 0; i<table.getRowCount(); i++) { 
    int value=table.getRow(i).getInt("Steps");
    float mappedValue=map(value, 0, max, 0, width);
    ellipse(width/2, height/2, mappedValue, mappedValue);
  }
}