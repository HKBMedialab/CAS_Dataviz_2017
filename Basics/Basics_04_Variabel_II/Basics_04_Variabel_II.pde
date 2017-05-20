/*
HKB CAS Data Visualization 2017
Einführung
Michael Flueckiger
*/

/*
Globale Variabeln definieren:
 Variabeln müssen zuerst einen Typen haben und können dann entsprechende Werte zugewiesen bekommen.
 
 -> Der Computer muss wissen, ob es eine Farbe oder eine Zahl oder ein Wort ist:
 z.B 
 color steht für Farbe
 int steht für eine natürliche Zahl 
 float steht für eine Zahl, die auch Kommastellen haben kann
 string steht für eine Kette von Buchstaben
 boolean steht für einen boolschen Wert, etwas, das entweder wahr oder falsch sein kann
 
 */


// Variabledeclaration:
color mycolor=color(100, 100, 200); //rgb



void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
}

void draw() {
  //jedes Mal, wenn das Programm wieder neu in den Drawloop eintritt, 
  //wird der Grün- und Blauwert unserer Farbvariabel neu zugewiesen:
  mycolor=color(100, mouseY, mouseX);
  fill(mycolor);
  ellipse(mouseX, mouseY, 30, 30);
}