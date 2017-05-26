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

  for (int i = 0; i<table.getRowCount(); i++) { //ABK für  for (int i = 0; i < zeilen.length; i++ ){int wert = zeilen[i];}
    TableRow row = table.getRow(i);
    int value=row.getInt("total  #1");
    println(value);
    value/=300;
    noFill();
    rectMode(CENTER);
    stroke(i*hueStep, 255, 255);
    //rect(width/2, height/2, value, value);
  }

  //noStroke();


  int superTotalZimmer=0;
  for (int i = 0; i<table.getRowCount(); i++) { //ABK für  for (int i = 0; i < zeilen.length; i++ ){int wert = zeilen[i];}
    TableRow row = table.getRow(i);
    int zimmer_1=row.getInt("1 Zimmer");
    int zimmer_2=row.getInt("2 Zimmer");
    int zimmer_3=row.getInt("3 Zimmer");
    int zimmer_4=row.getInt("4 Zimmer");
    int zimmer_5=row.getInt("5 Zimmer");
    int zimmer_6=row.getInt("6 Zimmer");
    int zimmer_7=row.getInt("7 Zimmer");
    int zimmer_8=row.getInt("8 u. mehr Zimmer");

    int totalZimmer=zimmer_1+zimmer_2+zimmer_3+zimmer_4+zimmer_5+zimmer_6+zimmer_7+zimmer_8;
    superTotalZimmer+=totalZimmer;
  }



  // float rotStep=(2*PI)/superTotalZimmer;

rectsize=8;
  int shifter=0;
  int shift=20;
  noStroke();
  pushMatrix();
  translate(100, 100);
  fill(0, 255, 255, 100);
  text("1 Zimmer", 0, shifter);
  
  shifter+=shift;
  fill(30, 255, 255, 100);
  text("2 Zimmer", 0, shifter);

  shifter+=shift;
  fill(60, 255, 255, 100);
  text("3 Zimmer",0, shifter);

  shifter+=shift;
  fill(90, 255, 255, 100);
  text("4 Zimmer", 0, shifter);

  shifter+=shift;
  fill(120, 255, 255, 100);
  text("5 Zimmer", 0, shifter);

  shifter+=shift;
  fill(150, 255, 255, 100);
  text("6 Zimmer", 0, shifter);

  shifter+=shift;
  fill(180, 255, 255, 100);
  text("7 Zimmer",0, shifter);

  shifter+=shift;
  fill(210, 255, 255, 100);
  text("8 Zimmer", 0, shifter);

  popMatrix();


  float rotStep=(2*PI)/table.getRowCount();


  for (int i = 0; i<table.getRowCount(); i++) { //ABK für  for (int i = 0; i < zeilen.length; i++ ){int wert = zeilen[i];}
    TableRow row = table.getRow(i);
    int zimmer_1=row.getInt("1 Zimmer");
    int zimmer_2=row.getInt("2 Zimmer");
    int zimmer_3=row.getInt("3 Zimmer");
    int zimmer_4=row.getInt("4 Zimmer");
    int zimmer_5=row.getInt("5 Zimmer");
    int zimmer_6=row.getInt("6 Zimmer");
    int zimmer_7=row.getInt("7 Zimmer");
    int zimmer_8=row.getInt("8 u. mehr Zimmer");

    int totalZimmer=zimmer_1+zimmer_2+zimmer_3+zimmer_4+zimmer_5+zimmer_6+zimmer_7+zimmer_8;

    pushMatrix();
    translate(width/2, height/2);

    rotate(i*rotStep);
    stroke(255, 100, 100, 30);
    line(50, 0, width/2-80, 0);
    pushMatrix();
    translate(width/2-30, 0);
    rotate(-i*rotStep);

    //text(row.getString("Jahr"),0,0);
    popMatrix();

    //  rotate(i*rotStep);

    noStroke();

    fill(0, 255, 255, 100);
    /* rect(zimmer_1/scale, 0, rectsize, rectsize);
     fill(30, 255, 255, 100);
     rect(zimmer_2/scale, 0, rectsize*2, rectsize*2);
     fill(60, 255, 255, 100);
     rect(zimmer_3/scale, 0, rectsize*3, rectsize*3);
     fill(90, 255, 255, 100);
     rect(zimmer_4/scale, 0, rectsize*4, rectsize*4);
     fill(120, 255, 255, 100);
     rect(zimmer_5/scale, 0, rectsize*5, rectsize*5);
     fill(150, 255, 255, 100);
     rect(zimmer_6/scale, 0, rectsize*6, rectsize*6);
     fill(180, 255, 255, 100);
     rect(zimmer_7/scale, 0, rectsize*7, rectsize*7);
     fill(210, 255, 255, 100);
     rect(zimmer_8/scale, 0, rectsize*8, rectsize*8);
     */


    rect(zimmer_1/scale, 0, rectsize, rectsize);
    fill(30, 255, 255, 100);
    rect(zimmer_2/scale, 0, rectsize, rectsize);
    fill(60, 255, 255, 100);
    rect(zimmer_3/scale, 0, rectsize, rectsize);
    fill(90, 255, 255, 100);
    rect(zimmer_4/scale, 0, rectsize, rectsize);
    fill(120, 255, 255, 100);
    rect(zimmer_5/scale, 0, rectsize, rectsize);
    fill(150, 255, 255, 100);
    rect(zimmer_6/scale, 0, rectsize, rectsize);
    fill(180, 255, 255, 100);
    rect(zimmer_7/scale, 0, rectsize, rectsize);
    fill(210, 255, 255, 100);
    rect(zimmer_8/scale, 0, rectsize, rectsize);


    popMatrix();
  }
  println("yeah");
}