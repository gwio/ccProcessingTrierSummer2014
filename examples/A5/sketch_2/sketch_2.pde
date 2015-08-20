
//Fontobjekt
PFont font;
//String zum Zeichnen in draw
String s;
//Array von chars zum manipulieren
char[] cArray;

void setup() {
  colorMode(HSB, 360, 100, 100);
  // Uncomment the following two lines to see the available fonts 
  // String[] fontList = PFont.list();
  // println(fontList);  colorMode(HSB, 360, 100, 100);
  size (600, 400);

  //lädt einen Font + Größe
  font = createFont("Courier", 140);
  //definiert den Font der benutzt werden soll
  textFont(font);

  s = "Hello World!";

  //das Char Array soll so lang sein wie "Hello World!"
  cArray = new char[s.length()];

  //In dem Loop bekommt das Char Array den Buchstaben aus dem String s zugewiesen, beide sind gleich lang
  for (int i = 0; i < cArray.length; i++) {
    cArray[i] = s.charAt(i);
  }
}


void draw() {
  //background(0, 0, 255);
  fill(0, 0, 0);
  textSize(70);
  textAlign(CENTER);
  text(s, width/2, height/2  );
  noStroke();

  //Kleider Fadde Effekt, transparentes Rechteck 
  fill(0, 0, 255, 80);
  rect(0, 0, width, height);
}

void keyPressed() {
  //Eine zufällige Zahl die so groß sein kann wie das Char Array, Arrays können nur mit INT angesprochen werden
  int temp = int( random(cArray.length) );
  //das Char Array wird an der zufälligen Stele verändert, 33-125 stehen für Zeichen in der ASCI Tabelle
  cArray[temp] = char( int( random(33, 125) ) );
  //Der String zum Zeichnen wird aktualisiert
  s = new String(cArray);
}

