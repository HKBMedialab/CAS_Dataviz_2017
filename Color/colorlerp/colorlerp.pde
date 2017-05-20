/*
HKB CAS Data Visualization 2017
Color Einführung
Farbinterpolieren

*/
size(420,500);
stroke(255);
background(51);
//Startfarbe
color from = color(250, 102, 0);
//Zielfarbe
color to = color(0, 102, 153);
//Zwischentöne
color interA = lerpColor(from, to, .33);
color interB = lerpColor(from, to, .66);


fill(from);
rect(10, 10, 100, 480);
fill(interA);
rect(110, 10, 100, 480);
fill(interB);
rect(210, 10, 100, 480);
fill(to);
rect(310, 10, 100, 480);