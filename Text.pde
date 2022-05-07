int textID = 0;
int textDisplaying = 0;
float textTimer = 0;
PFont font;


class Text{
  int id;
  String content;
  boolean finished = false;
  
  Text(String content){
    id = textID;
    textID++;
    this.content = content;
  }
  
  void display(){
    String display;
    if (textDisplaying == this.id){
      player.moveable = false;
      textTimer += 0.25;
      if(textTimer >= this.content.length()){
        textTimer = this.content.length();
      }
      display = this.content.substring(0,floor(textTimer));
      noStroke();
      fill(0,200);
      rectMode(CORNER);
      rect(0,250,1024,170);
      fill(255);
      textFont(font);
      text(display,50,320);
    }
  }
}
