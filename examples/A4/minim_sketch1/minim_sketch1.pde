
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
  size(1100, 400);
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
  translate(0, height/2);
  
  //Linie für das Volume
  beginShape();
  for (int i = 0; i < audioBufferSize; i++) {
    
    float posX = map(i, 0, audioBufferSize, 0, width);
    //Volume hat 1 und -1 als Max und Min
    float posY = map( in.mix.get(i) , -1, 1, -200, 200);
    
    //einzelne Punkte
    vertex(posX, posY);
    
  }
  endShape();
  popMatrix();
  
  
  noStroke();
  fill(51,10,89,29);
  rect(0,0, width, height);
  
  //println(frameRate);
}

