PFont courier;
PFont times;
String[] text;
String zeile;
String[] words;
int textSize;

int mouseCounter;
void setup() {
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
  size(900, 500);


  courier = createFont("Courier", 100);
  times = createFont("Times", 100);

  text = loadStrings("kafka.txt");
  println(text.length);
  textSize = text.length;

  zeile = text[ int(random(textSize) ) ];
  words = split(zeile, ' ');

  mouseCounter = 0;

  textAlign(LEFT);

  background(33, 5, 220);
  textFont(courier);
  textSize(16);
  fill(0, 50, 50);
  text(zeile, 16, 40);
  text(zeile, 16, 40);
}


void draw() {
}

void mousePressed() {

  if (mouseCounter == words.length) {
    zeile = text[ int(random(textSize) ) ];

    words = split(zeile, ' ');
    mouseCounter = 0;

    textAlign(LEFT);
    background(33, 5, 220);
    textFont(courier);
    textSize(16);
    fill(0, 50, 50);
    text(zeile, 16, 40);
  }


  textAlign(CENTER);
  textFont(times);
  textSize(random(200)+10);
  fill(0, 10, 20, random(50, 150));
  text( words[mouseCounter], mouseX, mouseY);
  mouseCounter++;
}