/*
HKB CAS Data Visualization 2016
Color Einführung
*/
 
 
size(400, 400); // Die Grösse der Canvas 
background (110);  // Hintergrund der Canvas

/* 
 Im RGB-Farbraum mischen sich Graustufen aus den jeweils gleichen 
 Anteile der Farbkanäle. Graustufen lassen sich daher mit einer einzigen Angabe abkürzen
 fill(0,0,0) ist genau gleich wie fill(0)
 */

fill (0);          // Füllung
stroke (255);      // Outline
rect (100, 100, 100, 100); 

fill (255);          // Füllung
stroke (0);      // Outline
ellipse(250, 250, 100, 100); 


/* Transparenz
 Als zweiter Wert kann die Transparenz angegeben werden. 
 Auch hier ist der Wertebereich zwischen 0 und 255
 */
 
fill (255, 100);          // Füllung
stroke (0);      // Outline
ellipse(200, 200, 100, 100); 