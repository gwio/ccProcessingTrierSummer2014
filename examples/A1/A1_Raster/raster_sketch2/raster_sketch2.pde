
int gridX = 16;
int gridY = 20;
int gridSize = 32;

void setup() {

  //processing 3
  size(512, 640);

  //processing2
  //size( gridX * gridSize, gridY * gridSize );

  colorMode(HSB, 360, 100, 100, 100);

  rectMode(CENTER);

  translate(gridSize/2, gridSize/2);

  color farbe1 = color(111, 71, 47);
  color farbe2 = color(111, 17, 79);

  background(farbe1);
  noStroke();

  for (int i = 0; i < gridX; i++) {
    for (int j = 0; j < gridY; j++) {

      fill(farbe1);
      rect(i*gridSize, j*gridSize, gridSize, gridSize);
      /*
       Statt dem Kreis kommt hier jetzt ein Quadrat, was noch um 45° gedreht ist.
       translate() und rotate() bedeuten soviel wie, gehe an diese Position (translate) und rotiere um diesen Wert (rotate),
       und dann wird an dieser Stelle das Rechteck gezeichnet, und die Positonsänderung udn Drehung ist automatisch schon drin,
       dabei passiert dass alles zwischen pushMatrix() und popMatrix(), damit sagt man, dass die Änderung nur für die Elemente gilt, 
       die zwischen den beiden Zeilen geschrieben werden.
       Man kann sich den Unterschied gut klarmachen wenn man das mit dem ersten rect() von oben vergleicht.
       */

      pushMatrix();

      translate(i*gridSize, j*gridSize);
      //360° sind TWO_PI, 180 PI, 90 HALF_PI und 45 QUARTER_PI
      rotate(QUARTER_PI);

      fill(farbe2);
      rect(0, 0, gridSize*0.5, gridSize*0.5);

      popMatrix();
    }
  }
}


void draw() {
}


void keyPressed() {
  saveFrame();
}