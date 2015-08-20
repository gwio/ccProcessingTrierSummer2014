/*
gridX, gridY und gridSize bestimmen die Auflösung, diese Variablen werden auch 
 weiter unten benutzt um das Raster zu zeichnen, gridSize ist die Größe der Kästchen in Pixeln
 und gridX und gridY die horizontalen und vertikalten Elemente
 
 
 Die Variablen sind als "globale Variablen" definiert, also weil sie nicht im setup() und draw() drin sind, 
 und deswegen kann man von überall auf sie zugreifen
 */
int gridX = 12;
int gridY = 16;
int gridSize = 32;

void setup() {

  // Die Auflösung wird aus den Variablen oben automatisch berechnet

  //processing 2
  //size( gridX * gridSize, gridY * gridSize );

  //no variables with processing 3 beta :/
  size(384, 512);

  //Farbmodus HSB, tools-> color selector
  colorMode(HSB, 360, 100, 100, 100);

  //Rechtecke werden mit diesem Befehl immer "zentriert" gezeichnet und nicht von der oberen linken Ecke aus
  rectMode(CENTER);

  //Verschieb alle nachfolgenden Elemente, also alles was gezeichnet wird, um ein halbes Kästchen (gridSize/2), damit das Raster genau ins Fenster passt
  translate(gridSize/2, gridSize/2);

  //so kann man eine Farbe definiern um sie später in fill() oder stroke() zu benutzen, man braucht dann keine Zahlen schreiben
  color farbe1 = color(151, 71, 47);
  color farbe2 = color(151, 17, 79);

  //Einmal die Hintergrundfläche füllen
  background(farbe1);
  //keine Outlines zeichnen
  noStroke();

  /*
  Hier wird mit 2 verschachtelten for-loops das Raster logisch definiert, also mit den gridX und gridY von oben.
   i und j starten immer bei 0 und zählen solange hoch "x++" bis sie kleiner als gridX,gridY sind.
   */
  for (int i = 0; i < gridX; i++) {
    for (int j = 0; j < gridY; j++) {

      /*
      Zuerst wird ein Rechteck gezeichnet was genau in das Rasterkästchen passt.
       Die Position kommt immer von i und j , also X und Y Position, multipliziert mit der Rastergröße (gridSize),
       Für jedes Element wird das hier wiederholt -> for Loop
       */
      fill(farbe1);

      rect(i*gridSize, j*gridSize, gridSize, gridSize);

      //Kreis, der Radius soll etwas kleiner sein als das Kästchen
      fill(farbe2);

      ellipse(i*gridSize, j*gridSize, gridSize*0.7, gridSize*0.7);
    }
  }
}


void draw() {
  //hier passiert erstmal noch nix, aber das Programm läuft und reagiert auf INput....
}

//... hier kommt der Input, wen man eine Taste drückt, wird ein Screenshot im Sketchordner gespeichert (Ordner -> cmd+k, strg+k)
void keyPressed() {
  //speichert die Datei als frame.tiff
  saveFrame();
  // man kann auch einen Dateinamen und ein Format als Parameter eingeben zb
  //saveFrame("datei.png");
  //zb
  //saveFrame("datei.jpg");
}