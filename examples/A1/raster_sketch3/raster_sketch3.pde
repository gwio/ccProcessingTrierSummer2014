
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

  color farbe1 = color(66, 71, 47);
  color farbe2 = color(66, 17, 79);

  background(farbe1);
  noStroke();

  for (int i = 0; i < gridX; i++) {
    for (int j = 0; j < gridY; j++) {

      fill(farbe1);

      rect(i*gridSize, j*gridSize, gridSize, gridSize);

      /*
       map() ist ein wichtiger Befehl den man oft brauchen wird, vor allem wenn man zb einen Input hat aus einer Textdatei, oder aus nem Audiosample nimmt,
       und man möchte es nutzem um bestimmte Sachen zu zeichnen, dann kann man die Werte mit map() umrechnen lassen.
       
       Damit hier jetzt die Rauten zur Mitte kleiner werden, kann ich nicht mehr einfach in rect() bei der Größe, gridSize benutzen,
       ich nehme aber j (weil ich die Veränderung auf der vertikalen Ebene haben möchte) und lasse die Werte, j fängt bei 0 an (oberstes Kästchen) und hört bei 19 auf( unterstes Kästchen),
       umrechnen zu, oben 0 -> -gridSize, also -32, und unten 19 -> gridSize, also 32, logischerweise ist dann etwa bei der Mitte von "j" 0 und die Rauten werden zur Mitte hin kleiner,
       rect() kann bei der Größe auch einen negativen Wert benutzen, also sieht beides gleich aus, egal ob -32 oder 32
       
       */
      float objectSize;

      objectSize = map(j, 0, gridY-1, -gridSize, gridSize );


      pushMatrix();

      translate(i*gridSize, j*gridSize);

      rotate(QUARTER_PI);

      fill(farbe2);

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