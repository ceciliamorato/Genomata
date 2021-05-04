/* Class that generates buttons, displays them and controls the rollover and clicks. */

class SongButton {

  Rectangle r,r1;
  float w, h;
  String song_name;
  boolean clickedOn = false;
  boolean rolloverOn = false;


  SongButton(float x_, float y_, String sn) {
    this.w = width/4.5;
    this.h = height/30;
    this.song_name = sn;
    this.r = new Rectangle(x_, y_, w, h);
    this.r1 = new Rectangle(x_, y_, w, 1.5*this.h);
  }

  void display() {
    rectMode(CORNER);
    stroke(20.37, 57, 100);
    strokeWeight(0.9);
    fill(355);
    if (rolloverOn) fill(20.37, 57, 100, 200);
    rect(r.x, r.y, r.ww, r.hh, 7);

    fill(0);
    textAlign(CENTER, CENTER);
    textFont(font);
    text(song_name, r.x, r.y-1, this.w, this.h);
  }

  void display(float f) {
    rectMode(CORNER);
    stroke(1); 
    fill(355);
    if (rolloverOn) fill(20.37, 57, 100, 200);
    rect(r1.x, r1.y, r1.ww, r1.hh, 7);

    fill(0);
    textAlign(LEFT,CENTER);
    textFont(font,13);
    text(song_name, r1.x+3, r1.y-1, r1.ww, r1.hh);
    fill(0);
    rect(r.x-62, r.y, 60, r1.hh);
    textAlign(CENTER,CENTER);
    fill(360);
    textFont(font,17);
    text(""+int(f), r.x-30, r.y+this.h/2+2);
  }
  
  void displayA() {
    rectMode(CORNER);
    stroke(1); 
    fill(355);
    if (rolloverOn) fill(20.37, 57, 100, 200);
    rect(r1.x, r1.y, r1.ww, r1.hh, 7);

    fill(0);
    textAlign(LEFT,CENTER);
    textFont(font,13);
    text(song_name, r1.x+3, r1.y-1, r1.ww, r1.hh);
  }

  void displayB() {
    rectMode(CORNER);
    stroke(1); 
    fill(355);
    if (rolloverOn) fill(20.37, 57, 100, 200);
    rect(r.x, r.y, r.ww, r.hh, 7);

    fill(0);
    textAlign(LEFT);
    textFont(font);
    text(song_name, r.x+3, r.y+15);
  }

  void displayL() {
    background(0); 
    rectMode(CORNER);
    noStroke();
    fill(0);
    rect(r.x, r.y, r.ww, r.hh, 7);
    fill(355);
    textAlign(CENTER, CENTER);
    textFont(font, 20);
    text(song_name, r.x+width*1./10, r.y+height*1./60-2);
  }

  boolean rollover(int mx, int my, Rectangle rx) {
    if (rx.contains(mx, my)) rolloverOn = true;
    else rolloverOn = false;
    return rolloverOn;
  }

  boolean clicked(int mx, int my, Rectangle rx) {
    if (rx.contains(mx, my)) clickedOn = true;
    return clickedOn;
  }
}
