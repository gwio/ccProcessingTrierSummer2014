
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

  color farbe1 = color(370, 71, 47);
  color farbe2 = color(370, 17, 79);

  background(farbe1);
  noStroke();

  for (int i = 0; i < gridX; i++) {
    for (int j = 0; j < gridY; j++) {

      /*
      Mit dieser if Bedingung, kann man nur einen Bestimmten Bereich im Raster auswählen,
       also hier erst ab dem 3 "Ring" siehe Bild in der Pdf
       */
      if ( (i > 1) && (i < gridX-2) && (j > 1) && (j < gridY-2) ) {

        float randomNumber = random(0, 100);

        if (randomNumber > 80) {
          fill(farbe1);
        } else {
          fill(farbe2);
        }

        rect(i*gridSize, j*gridSize, gridSize, gridSize);

        float objectSize;
        objectSize = map(j, 0, gridY-1, -gridSize, gridSize );

        if (randomNumber > 80) {
          fill(farbe2);
        } else {
          fill(farbe1);
        }

        pushMatrix();
        translate(i*gridSize, j*gridSize);
        rotate(QUARTER_PI);
        rect(0, 0, objectSize*0.7, objectSize*0.7);
        popMatrix();
      } 
      // Die beiden äusseren Ringe werden anders dargestellt
      else {
        fill(farbe2);
        ellipse(i*gridSize, j*gridSize, gridSize*0.7, gridSize*0.7);
      }
    }
  }
}


void draw() {
}

void keyPressed() {
  saveFrame();
}