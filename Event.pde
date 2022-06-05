// 事件物件，處理各種要放在地圖中可以與玩家互動的東西
class Event{
  PImage lockerImg;
  PImage img;
  PImage img2;
  PImage img3;
  PImage imgHovered;
  String where; // 事件的位置場景
  float x;  // 事件在場景中的x座標
  float y;  // 事件在場景中的y座標
  float w;  // 寬度
  float h;  // 高度
  int stage = 0; // 事件階段(-1表示事件已關閉，不會再被觸發)
  Boolean playing = false;
  // 適用於一般事件建構式
  Event(){
    stage = 0;
  }
  
  //測試用
  Event(int stage){
    this.stage = stage;
  }
  
  // 適用於置物櫃的建構式
  Event(PImage img,PImage img2,PImage img3,String where,float x,float y, float w,float h){
    stage = 0;
    this.img = img;
    this.img2 = img2;
    this.img3 = img3;
    this.where = where;
    this.x = x; // x座標
    this.y = y; // y座標
    this.w = w; // 寬度
    this.h = h; // 高度
  }
  
  // 適用於不帶圖片的事件建構式
  Event(String where,float x,float y, float w,float h){
    stage = 0;
    this.where = where;
    this.x = x; // x座標
    this.y = y; // y座標
    this.w = w; // 寬度
    this.h = h; // 高度
  }
  
  // 適用於帶圖片的事件建構式
  Event(PImage img,String where,float x,float y, float w,float h){
    stage = 0;
    this.img = img;
    this.where = where;
    this.x = x; // x座標
    this.y = y; // y座標
    this.w = w; // 寬度
    this.h = h; // 高度
  }
  
  // 適用於帶圖片的事件建構式
  Event(PImage img,PImage imgHovered,String where,float x,float y, float w,float h){
    stage = 0;
    this.imgHovered = imgHovered;
    this.img = img;
    this.where = where;
    this.x = x; // x座標
    this.y = y; // y座標
    this.w = w; // 寬度
    this.h = h; // 高度
  }
  
  void update(){
    
  }
  
  void display(){
    if(img3 != null){
      switch(stage){
        case 0:
          lockerImg = img;
          break;
        case 1:
          lockerImg = img2;
          break;
        case -1:
          lockerImg = img3;
          break;
      }
      image(lockerImg,x,y);
    }else if(img!=null && this.where == player.where && stage!=-1){
      image(img,x,y);
    }
  }
  
  //玩家觸碰偵測
  Boolean playerTouched(){
    if(player.where==this.where && player.x>=this.x && player.x<=this.x+this.w){
      return true;
    }
    return false;
  }
  
  //滑鼠觸碰偵測
  Boolean hovered(){
    if(player.where==this.where && mouseX>=this.x+cameraOffsetX && mouseX<=this.x+this.w+cameraOffsetX && mouseY>=this.y && mouseY<=this.y+this.h){
      return true;
    }
    return false;
  }
  
  //滑鼠點擊偵測
  Boolean clicked(){
    if(hovered() && player.moveable && stage!=-1){
      if(mousePressed){
        return true;
      }
    }
    return false;
  }
}
