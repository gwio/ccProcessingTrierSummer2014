// Arrays & Chars & String

// "normale" Variable
int variable;

// Arrays sind wie Kisten für Daten
// Ein Array erkennt man immer an den [ ]
// Aus jedem Datentyp kann man ein Array machen zb float[], int[], PImage[], boolean[]
int[] array;

//Ein Char ist ein Datentyp für "Buchstaben", ein Char kann immer nur ein Zeichen haben
char c;

//Ein String ist eine Liste von aneinandergereihten Zeichen, also ein Array von chars 
String s;

void setup() {

  //chars werden immer mit zwei Apostrophs? markiert ' '
  c = 'a';
  println(c);

  //oder mit der entsprechenden Zahl aus der asci Tabelle
  c = 97;
  println(c);

  //strings werden mit Anführungszeichen definiert " "
  s = "das ist: ";

  variable = 12;
  println(s+variable);

  // Ein Array muss immer erst mit einer Größe initialisiert werden
  array = new int[10];

  // array.length ist immer so lang wie das Array, ein Array fängt immer bei 0 an
  for (int i = 0; i < array.length; i++) {
    //mit array[i] kann man auf eine bestimmte Position zugreifen, genauso wie bei normalen Variablen , nur mit den []
    //hier wird das Array im loop "gefüllt"
    array[i] = i;
  }


  for (int i = 0; i < array.length; i++) {
    println(s+"array Nr "+array[i]);
  }

  //mit string.length() kann man die Länge eines "String Arrays" abrufen
  println("s hat "+s.length()+" Zeichen");
}