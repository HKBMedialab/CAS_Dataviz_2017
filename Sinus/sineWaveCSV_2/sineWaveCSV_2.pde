float x;
float y;
float theta;
float waveLength=50;

int xNum =floor((waveLength/(2*PI)));
float xSpacing =waveLength/xNum;
float stretch=1;

int dX;
float [] pointsX;
float [] pointsY;

float amplitude=50;


Table table;



void setup() {
  size(1100, 1100);
  println("X Spacing "+xNum);
  background(255);

  // xNum=floor(xSpacing);
  pointsX = new float[xNum];
  for (int i=0; i<pointsX.length; i++) {
    pointsX[i]=i*xSpacing;
  }
  pointsY = new float[xNum];
  println(pointsX.length);


  // load data
  table = loadTable("WetterHistory.csv", "header");
  // check output
  println(table.getRowCount() + " total rows in table"); 


  float xPos=0;
  float yPos=100;


  for (TableRow row : table.rows()) { //ABK für  for (int i = 0; i < zeilen.length; i++ ){int wert = zeilen[i];}
    float value=row.getFloat("Wind speed daily max [10 m above gnd]");
    println(value);
    pushMatrix();
    translate(xPos, yPos);
    stroke(0, 0, random(255));
    calcOneWave(value);
    renderWaveCurve();
    xPos+=waveLength;
    if (xPos>width) {
      xPos=0;
      yPos+=50;
    }
    popMatrix();
  }
}

void draw() {
  background(255);
  /* 
   calcOneWave(amplitude/2);
   pushMatrix();
   translate(20, width/2);
   stroke(0);  
   //renderWave();
   // renderX();
   stroke(255);
   translate(0, 50);
   renderWaveCurve();
   calcOneWave(amplitude);
   translate(waveLength, 0);
   renderWaveCurve();
   popMatrix();*/


  translate(waveLength/2, 100);
  float xPos=0;
  float yPos=0;

  theta-=0.1;

  for (TableRow row : table.rows()) { //ABK für  for (int i = 0; i < zeilen.length; i++ ){int wert = zeilen[i];}
    float value=row.getFloat("Wind speed daily max [10 m above gnd]");
    pushMatrix();
    translate(xPos, yPos);
    stroke(100, 100, 255);
    calcOneWaveAnimated(value);
    renderWaveCurve();
    xPos+=waveLength;
    if (xPos>(width-2*waveLength)) {

      xPos=0;
      yPos+=50;
    }
    popMatrix();
  }
}



void calcOneWave(float amplitude) {
  theta-=0.01;
  for (int i=0; i<pointsY.length; i++) {
    pointsY[i] = sin(((2*PI)/xNum*i))*amplitude;
  }
}

void calcOneWaveAnimated(float amplitude) {
  for (int i=0; i<pointsY.length; i++) {
    pointsY[i] = sin(((2*PI)/xNum*i)+theta)*amplitude;
  }
}


void renderWaveCurve() {
  noFill();
  beginShape();
  curveVertex(pointsX[0], 0);

  for (int i=0; i<pointsX.length; i++) {
    curveVertex(pointsX[i], pointsY[i]);
  }    
  curveVertex(pointsX[pointsX.length-1]+xSpacing, 0);
  //curveVertex(pointsX[pointsX.length-1]+xSpacing, 0);
  endShape();
}