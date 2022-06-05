// 對話串物件

class Dialogue extends Animation{
  int playing = 0;// 目前播放第幾行
  String[] texts;// 對話內容
  float speed = 1;// 播放速度參數
  String textDisplaying; // 存放目前正在播放的文字
  
  PImage image = null;// 對話頭貼
  String name = null; // 講話的人名
  String title; // 系統提示文字標題
  
  // 系統提示文字建構式
  Dialogue(String title,String[] texts){
    super();
    duration = 10;
    timer = 0;
    playing = 0;
    type = "TEXT";
    this.title = title;
    this.texts = texts;
    textDisplaying = " ";
  }
  
  // 單行系統提示文字建構式
  Dialogue(String title,String texts){
    super();
    duration = 10;
    timer = 0;
    playing = 0;
    type = "TEXT";
    this.title = title;
    this.texts = new String[1];
    this.texts[0] = texts;
    textDisplaying = " ";
  }
  
  // 一串對話建構式
  Dialogue(PImage image,String name,String[] texts){
    super();
    timer = 0;
    playing = 0;
    type = "DIALOGUE";
    this.texts = texts;
    textDisplaying = " ";
    this.image = image;
    this.name = name;
  }
  
  // 一句對話建構式
  Dialogue(PImage image,String name,String text){
    super();
    timer = 0;
    playing = 0;
    type = "DIALOGUE";
    this.texts = new String[1];
    texts[0] = text;
    textDisplaying = " ";
    this.image = image;
    this.name = name;
  }
  
  // 物件資訊建構式
  Dialogue(Item item){
    super();
    duration = 40;
    type = "ITEMINFO";
    timer = 0;
    playing = 0;
    this.texts = item.info;
    textDisplaying = " ";
    this.image = item.bigImg;
    this.name = item.name;
  }
  
  void update(){
    switch(type){
      case "TEXT":case "ITEMINFO":
        timer = (timer>=duration)? duration : timer+this.speed;
        // 對話文字更新
        textFont(font);
        textDisplaying = texts[playing];
        break;
      case "DIALOGUE":
        timer = (timer>=texts[playing].length())? texts[playing].length() : timer+this.speed;
        // 對話文字更新
        textFont(font);
        fill(255);
        textDisplaying = texts[playing].substring(0,floor(timer));
        break;
    }
    if(!closed){
      player.moveable = false;
    }
  }
  void display(){
    noStroke();
    switch(type){
      case "ITEMINFO": // 物品資訊
        // 對話底色色塊;
        fill(#535162,220);
        rectMode(CORNER);
        rect(0,0,width,height);
        // 物品圖片
        image(image,0,0,400,420);
        //標題
        textSize(23);
        fill(#E5BA9C,map(timer,0,duration-10,0,255));
        text(name,426,62);
        //內文
        fill(255,map(timer,0,duration-10,0,255));
        textFont(font);
        textSize(19);
        textLeading(35);
        text(textDisplaying,424,90,550,260);
        // 等待滑鼠點擊進入下一個句子，或結束對話
        clickWaiting();
        break;
      case "DIALOGUE": // 帶頭貼與人名的對話顯示
        // 對話底色色塊
        fill(#2F2D3D,180);
        rectMode(CORNER);
        rect(0,320,width,100);
        // 頭像
        image(image,0,173);
        textSize(16);
        fill(#E5BA9C); // 角色名字
        text(name+" ：",210,345);
        fill(255); // 顯示對話文字
        textSize(21);
        text(textDisplaying,210,355,745,55);
        // 等待滑鼠點擊進入下一個句子，或結束對話
        clickWaiting();
        break;
      case "TEXT": // 系統提示文字
        // 對話底色色塊
        fill(#2F2D3D);
        stroke(#A58087);
        strokeWeight(1.5);
        rectMode(CENTER);
        rect(512,213,495,map(timer,0,duration,0,96),9);
        rectMode(CORNER);
        // 顯示對話文字
        if(timer == duration){
          textAlign(CENTER);
          fill(#E5BA9C);
          textSize(17);
          text(title,width/2,195);
          fill(255);
          textSize(21);
          text(textDisplaying,324,213,376,28);
          textAlign(LEFT);
        }
        // 等待滑鼠點擊進入下一個句子，或結束對話
        clickWaiting();
        break;
    }
  }
  
  void clickWaiting(){
    if((type == "DIALOGUE" && timer == texts[playing].length()) || (type == "ITEMINFO" && timer == duration) || (type == "TEXT" && timer == duration)){
      switch(type){ // 箭頭指示符號
        case "DIALOGUE" : case "ITEMINFO":
          image(textend,963,375,35,23);
          break;
        case "TEXT":
          image(textend,726,238,24,14.4);
      }
      
      if(mousePressed||(keyPressed && key == 32)){
        if(playing<this.texts.length-1){
          playing++;
          timer = 0;
        }else{
          this.play = false;
          this.closed = true;
          player.moveable = true;
        }
      }
    }
  }
  
  void reset(){
    play = false;
    closed = false;
    playing = 0;
    speed = 0.5;
    timer = 0;
  }
}
