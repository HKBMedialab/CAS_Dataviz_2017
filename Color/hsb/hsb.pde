/*
HKB CAS Data Visualization 2017
Color Einführung

HSB Farbraum: 
fill(Winkel im Farbkreis,Sättigung,Helligkeit)

*/


int posX=0;
int posY=0;
int rectsize;



void setup() {
  size(600, 600);
rectsize=width/20;
  
  colorMode(HSB);



  for (int i=0; i<255; i++) {
    fill(i, 255, 255);
    rect(posX, posY, rectsize, rectsize);
    posX+=rectsize;
    if(posX>width-rectsize){
    posX=0;
    posY+=rectsize;
    }
  };
}


void draw() {
}