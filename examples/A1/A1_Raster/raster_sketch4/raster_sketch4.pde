
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

  color farbe1 = color(12, 71, 47);
  color farbe2 = color(12, 17, 79);

  background(farbe1);
  noStroke();

  for (int i = 0; i < gridX; i++) {
    for (int j = 0; j < gridY; j++) {

      // float randomNumber generiert für jede Position ein zufällige Zahl zwischen 0 un 100
      float randomNumber = random(0, 100);

      //Abhängig davon wird erstmal das Rechteck im Hintergrund eine Farbe bekommen
      if (randomNumber > 80) {
        fill(farbe1);
      } else {
        fill(farbe2);
      }

      rect(i*gridSize, j*gridSize, gridSize, gridSize);

      float objectSize;

      objectSize = map(j, 0, gridY-1, -gridSize, gridSize );

      pushMatrix();

      translate(i*gridSize, j*gridSize);

      rotate(QUARTER_PI);

      /*und das gleiche passiert nochmal für die Raute, dabei ist der Wert von randomNumber immernoch gleich, weil immernoch im gleichen Loop drin,
       deshalb bekommen beide Elemente dann eine andere Farbe, der Unterschied zu oben ist nur, dass farbe1 und farbe2 vertauscht sind
       */
      if (randomNumber > 80) {
        fill(farbe2);
      } else {
        fill(farbe1);
      }

      rect(0, 0, objectSize*0.5, objectSize*0.5);

      popMatrix();
    }
  }
}


void draw() {
}


void keyPressed() {
  saveFrame();
}