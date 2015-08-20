int gridSize = 32;

int gScale = 2;
PImage planck;

void setup() {
  planck = loadImage("kugelfisch.jpg");

  float  gridX = planck.width/gScale;
  float  gridY = planck.height/gScale;

  //size(gridX, gridY)
  //image width 120/2 * 32, image heigth 120/2 * 32
  size(1920, 1920);

  //not possible with processing3
  //size(gridX, gridY);

  rectMode(CENTER);

  translate(gridSize/2, gridSize/2);

  background(0, 0, 0);
  noStroke();

  for (int i = 0; i < gridX; i++) {
    for (int j = 0; j < gridY; j++) {

      color c = planck.get(i*gScale, j*gScale);   
      float objectSize;
      objectSize = map(brightness(c), 0, 255, 0, gridSize);

      pushMatrix();
      translate(i*gridSize, j*gridSize);
      rotate(objectSize/25);
      stroke( color( red(c), green(c), blue(c), 150) );
      strokeWeight(objectSize);
      line(0, 0, 0, objectSize*4);
      popMatrix();
    }
  }

  saveFrame();
}