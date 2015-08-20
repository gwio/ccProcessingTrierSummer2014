PImage bild;


void setup() {
  
  bild = loadImage("kugelfisch.jpg");
  
  size(120,120);

  //not possible with processing 3
  //size(bild.width, bild.height);
  
  image(bild,0,0);
  
}