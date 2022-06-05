// 遊戲介面中需要按鈕就放這葛東西
class Button{
  float x;
  float y;
  float w;
  float h;
  PImage img;
  PImage imgHovered;
  Boolean clicked = false;
  Boolean clickable = true;
  
  Boolean typing = false;
  Button(float x,float y,float w,float h,PImage img,PImage imgHovered){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.img = img;
    this.imgHovered = imgHovered;
  }
  
  void display(){
    if(clickable){
      if(hovered()){
        image(imgHovered,x,y,w,h);
      }else{
        image(img,x,y,w,h);
      }
      if(this.clicked()){
        clicked = true;
      }
    }else{
      tint(150);
      image(img,x,y,w,h);
      noTint();
    }
  }
  
  void display(String a){
    if(a=="typename"){
      if(hovered() || this.typing == true){
        image(imgHovered,x,y,w,h);
      }else{
        image(img,x,y,w,h);
      }
      if(this.clicked()){
        clicked = true;
      }
    }else{
      display();
    }
  }
  
  Boolean hovered(){
    if(mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h){
      return true;
    }
    return false;
  }
  
  Boolean clicked(){
    if(hovered() && mousePressed && clickable){
      return true;
    }
    return false;
  }
}
