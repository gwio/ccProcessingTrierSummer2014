
PImage bild;

int gridSize = 20;

void setup() {

  bild = loadImage("kugelfisch.jpg");

  //bild.width*gridSize, bild.height*gridSize
  size(2400, 2400);

  //not possible with processing3
  //size(bild.width*gridSize, bild.height*gridSize);

  background(0);
  translate(gridSize, gridSize);
  for (int i = 0; i < bild.width; i+=2) {
    for (int j = 0; j < bild.height; j+=2) {
      color c = bild.get(i, j);

      noStroke();
      float mapSize = map( brightness(c), 0, 255, 1, gridSize*2 );
      color b = color(red(c), green(c), blue(c), 60 );
      fill(b);
      ellipse(i*gridSize, j*gridSize, mapSize*4, mapSize*4);
    }
  }

  saveFrame();
}