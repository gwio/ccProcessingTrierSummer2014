
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

void setup() {
  size(600, 600);
  colorMode(HSB,360,100,100);

  //minim library starten
  minim = new Minim(this);
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();

  //audiobuffer size
  println(in.bufferSize());
  audioBufferSize = in.bufferSize();
}



void draw() {
  
  noFill();
  stroke(0,0,20);
  
  pushMatrix();
  translate(width/2, height/2);
  
  //Linie für das Volume
  beginShape();
  for (int i = 0; i < audioBufferSize; i++) {
    
    //Volume hat 1 und -1 als Max und Min
    float radius = map( in.mix.get(i) , -1, 1, 110, 300);
    float theta = TWO_PI/audioBufferSize;
    
    //einzelne Punkte
    vertex( sin(theta*i)*radius, cos(theta*i)*radius);
    
  }
  endShape();
  popMatrix();
  
  
  noStroke();
  fill(51,10,89,29);
  rect(0,0, width, height);
  
  println(frameRate);
}

