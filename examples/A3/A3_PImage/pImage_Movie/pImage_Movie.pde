//import video library, sketch->import library->add library "video"

import processing.video.*;

Movie movie;


int scaleF = 10;
void setup() {
  size(640, 360);
  background(0);


  // Load and play the video in a loop
  movie = new Movie(this, "transit.mov");
  movie.loop();
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  background(0);

  translate(scaleF/2, scaleF/2);
  noStroke();

  for (int i = 0; i < movie.width; i+=scaleF ) {
    for (int j = 0; j < movie.height; j+=scaleF ) {

      color c = movie.get(i, j);
      float mapSize = map( brightness(c), 0, 255, 1, scaleF );

      fill(c);
      ellipse(i, j, mapSize, mapSize);
    }
  }
  println(frameRate);
}