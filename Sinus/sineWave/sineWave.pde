float x;
float y;
float theta;
float xSpacing =5;
int dX;
float [] pointsX;
float [] pointsY;

float amplitude=10;

void setup() {
  size(500, 500);
  dX=floor(width/xSpacing);
  pointsX = new float[dX];
  for(int i=0;i<pointsX.length;i++){
  pointsX[i]=i*xSpacing;
  }
  pointsY = new float[dX];
  println(pointsX.length);
}

void draw() {
  background(0);
  /* for (int i=0; i<pointsY.length; i++) {
   ellipse(i*xSpacing, height/2+sin(i)*amplitude, 10, 10);
   }*/

  calcWave();
  pushMatrix();
  translate(0,width/2);
  renderWave();
  popMatrix();
}

void calcWave() {
  theta+=0.2;
  for (int i=0; i<pointsY.length; i++) {
    pointsY[i] = sin(pointsX[i]+i+theta)*amplitude;
  }
}

void renderWave() {
  for (int i=0; i<pointsX.length; i++) {
     ellipse(pointsX[i], pointsY[i], 10, 10);
  }
}