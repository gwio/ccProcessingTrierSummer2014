
//menu->sketch->import libraries->minim
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//Basisobjekt für alles mit Sound
Minim minim;

//input
AudioInput in;

int audioBufferSize;

//für die Kopie vom AudioBuffer
float[] tempAudioBuffer;

float radius, theta;
void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);

  //minim library starten
  minim = new Minim(this);
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();

  //audiobuffer size
  println(in.bufferSize());
  audioBufferSize = in.bufferSize();
  tempAudioBuffer = new float[audioBufferSize];
}



void draw() {

  noFill();
  stroke(0, 0, 20);
  //fill würde hier auch gehen
  // fill(0, 0, 20);

  pushMatrix();
  translate(width/2, height/2);

  //Linie für das Volume
  beginShape();
  for (int i = 0; i < audioBufferSize; i++) {

    //Das aktuelle "Echtzeit" Volume wir hier gespeichert
    float bufferVol = in.mix.get(i);
    //Hier das Volume aus dem  tempAudioBuffer Array
    float tempVol = tempAudioBuffer[i];

    theta = TWO_PI/audioBufferSize;

    //Damit die Linie nicht jeden Frame einen neuen Wert bekommt, soll sie nur neugezeichnet werden
    //wenn das Volume größer ist als der Wert im  tempAudioBuffer, ansonsten wir der Wert immer kleiner

    if ( abs(bufferVol) > abs(tempVol) ) {
      radius = map( bufferVol, -1, 1, 55, 300);
      //wichtig den neuen Wert ins tempAudioBuffer Array schreiben
      tempAudioBuffer[i] = bufferVol;
    } else {
      radius = map( tempVol, -1, 1, 55, 300);
      //Wert vekleinern
      tempAudioBuffer[i] *= 0.98;
    }

    // Vertexpunkte
    vertex( sin(theta*i)*radius, cos(theta*i)*radius);

    //curveVertex probieren...
    //curveVertex( sin(theta*i)*radius, cos(theta*i)*radius);
  }
  endShape(CLOSE);
  popMatrix();


  noStroke();
  fill(51, 10, 89, 29);
  rect(0, 0, width, height);

  //println(frameRate);
}

