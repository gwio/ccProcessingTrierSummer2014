
PImage bild;

int gridSize = 20;

void setup() {

  bild = loadImage("kugelfisch.jpg");

  //bild.width*gridSize, bild.height*gridSize
  size(2400, 2400);

  //not possible with processing3
  //size(bild.width*gridSize, bild.height*gridSize);


  for (int i = 0; i < bild.width; i+=2) {
    for (int j = 0; j < bild.height; j+=2) {
      color c = bild.get(i, j);

      tint(c);
      image(bild, i*gridSize, j* gridSize, gridSize*2, gridSize*2);

      //fill(c);
      //rect(i*gridSize, j* gridSize, gridSize, gridSize);
    }
  }

  saveFrame();
}