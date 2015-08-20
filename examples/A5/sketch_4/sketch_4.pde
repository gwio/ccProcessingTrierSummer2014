
PFont courier;

//Array mit allen Zeilen von der txt als einzelne Strings
String[] zeilen;
//Array "Liste" mit der Anzahl der gezählten Buchstaben
int[] buchstaben;

float farbe;

float counter;

void setup() {
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
  farbe = random(360);
  size(550, 250);

  courier = createFont("Courier", 100);

  //26 Buchstaben, 26 Positionen
  buchstaben = new int[26];

  /*
Lädt die txt aus dem data Ordner in das String Array, hier wird auch die größe automatisch festgelegt, also == Textzeilen
   zeilen[0] = "The Project Gutenberg EBook of Der Heizer, by Franz Kafka"
   zeilen[1] = " "
   zeilen[2] = "This eBook is for the use of anyone anywhere at no cost and with"
   ...
   ...
   ...
   */
  zeilen = loadStrings("kafka.txt");

  //dieser Loop geht durch alle Zeilen
  for (int i = 0; i < zeilen.length; i++) {
    //die Zeile wird in eine temporäre String Variable geschrieben, als toLowerCase, damit alle Buchstaben gezählt werden
    String temp_zeile = zeilen[i].toLowerCase();
    //der zweite Loop geht durch alle einzelnen Zeichen in der grade gespeicherten Zeile, hier .length() mit () 
    //Bei der Länge von Strings mit (), bei der Länge von Arrays ohne () :/
    for (int j = 0; j < temp_zeile.length(); j++) {
      //Die Zeichen werden alle in einer temporären Char Variable gespeichert 
      char temp_char = temp_zeile.charAt(j);
      //Wenn der Char zwischen 'a' und 'z' liegt, oder zwischen 97 und 122, bekommt der Wert im buchstaben[] an der passenden Stelle 1 +
      // asci table, alle Chars sind eingetlich Zahlen zwischen 1 und 127
      if ( (temp_char >= 'a') && (temp_char <= 'z') ) {
        // -97 damit alle Buchstaben zwischen 96 und 122 in das buchstaben Array passen, welches 26 Positionen hat
        // a -> 97  -> 97-97 = 0 -> buchstaben[0] -> Menge an a's usw.
        buchstaben[temp_char-97]++;
      }
    }
  }

  println(buchstaben);
}


void draw() {

  background(0, 0, 100);
  noStroke();

  float xPos = (width/26);

  translate(xPos/2, height*0.85);

  for (int i = 0; i < 26; i++) {

    //die Größe der Rechtecke hängt von der Anzahl der Buchstaben ab
    float rectSize = map(buchstaben[i], 0, 12000, 0, height*0.85);

    fill(farbe, (rectSize/3)*counter, (rectSize/4)*counter );

    rect( 0, 0, 10, -rectSize*counter );
    fill(farbe, 50, 50, 90);

    textFont(courier);
    textSize(20);
    text(char(i+65), -2, 20 );

    translate(xPos, 0);
  }

  if (counter < 1) {
    counter += 0.03;
  }
}

void mousePressed() {
  counter = 0;
  farbe = random(360);
}

