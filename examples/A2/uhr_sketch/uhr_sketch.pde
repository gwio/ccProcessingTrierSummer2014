float s;
float m;
float h;


void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
  strokeCap(SQUARE);
}


void draw() {
  background(0, 0, 100);
  //diese Werte bekommt Processing automatisch von der Systemzeit

  s = second();  // Values from 0 - 59
  m = minute();  // Values from 0 - 59
  h = hour();    // Values from 0 - 23

  //hier werden diese Werte auf den Bereich gemapt den man benutzen will, hier von zb 0-59 (sek als float) auf 0 bis TWO_PI
  //um damit einen Kreis zu zeichnen
  s = map(s, 0, 59, 0, TWO_PI);
  m = map(m, 0, 59, 0, TWO_PI);
  h = map(h, 0, 23, 0, TWO_PI);

  noFill();

  translate(width/2, height/2);
  //rotate kann TWO_PI, HALF_PI, PI, QUARTER_PI benutzen, siehe Reference
  rotate(-HALF_PI);  

  //man kann aber auch Grad verwenden, muss es vorher nur konvertieren mit radians(90);
  //rotate( radians(-90) );

  //stunden
  stroke(0, 100, 100);
  strokeWeight(20);
  arc(0, 0, 250, 250, 0, h);
  //minuten
  stroke(33, 100, 100);
  strokeWeight(12);
  arc(0, 0, 200, 200, 0, m);
  //sekunden
  stroke(66, 80, 80);
  strokeWeight(4);
  arc(0, 0, 150, 150, 0, s);
}

