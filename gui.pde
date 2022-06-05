// GUI圖片
PImage graphic = null;
PImage textend;
PImage bag,bagOpen;
PImage menu,menuOpen;

PImage new_game,new_game_hovered,load_game,load_game_hovered,record,record_hovered;
PImage start_play,start_play_hovered,start_skinchoose,start_skinchoose_hovered,skinchoose,typename,typename_hovered;
// 背包系統&選單系統
Boolean bagIsOpening = false;
Boolean menuIsOpening = false;
void loadGuiImg(){
  textend = loadImage("img/gui/textend.png");
  bag = loadImage("img/gui/bag_bag.png");
  bagOpen = loadImage("img/gui/bag_openbag.png");
  menu = loadImage("img/gui/menu_menu.png");
  menuOpen = loadImage("img/gui/menu_openmenu.png");
  
  new_game = loadImage("img/gui/new_game.png");
  new_game_hovered = loadImage("img/gui/new_game_hovered.png");
  load_game = loadImage("img/gui/load_game.png");
  load_game_hovered = loadImage("img/gui/load_game_hovered.png");
  record = loadImage("img/gui/record.png");
  record_hovered = loadImage("img/gui/record_hovered.png");
  start_play = loadImage("img/gui/start_play.png");
  start_play_hovered = loadImage("img/gui/start_play_hovered.png");
  start_skinchoose = loadImage("img/gui/start_skinchoose.png");
  start_skinchoose_hovered = loadImage("img/gui/start_skinchoose_hovered.png");
  skinchoose = loadImage("img/gui/skinchoose.png");
  typename = loadImage("img/gui/typename.png");
  typename_hovered = loadImage("img/gui/typename_hovered.png");
  playerName = new Button(796,247,211.5,80,typename,typename_hovered);
}
Button playerName;

// 遊戲主畫面
void homePage(){
  image(homepage_bg,0,0,width,height);
  Button newGame = new Button(574.5,248.6,173,52,new_game,new_game_hovered);
  Button loadGame = new Button(574.5,302.4,173,52,load_game,load_game_hovered);
  Button gameRecord = new Button(574.5,356.1,173,52,record,record_hovered);
  loadGame.clickable = false; //*之後要改掉* 
  gameRecord.clickable = false; //*之後要改掉*
  newGame.display();
  loadGame.display();
  gameRecord.display();
  if(newGame.clicked()){
    gameState = "PLAYER_SELECT";
  }
}

// 角色選擇畫面
int aniTimer = 0;
int selectCD = 0;
int currentSelect = 0; // 0:角色A, 1:角色B, 2:角色C
String nameString = "";
int nameLength = 0;
char keyIn = 0;
void playerSelect(){
  aniTimer++;
  selectCD = (selectCD==0)?0:selectCD-1;
  if(keyPressed && selectCD==0 && !playerName.typing){
    if(key == 'A'||key == 'a'){
      currentSelect = (currentSelect>0)?currentSelect-1:2;
      selectCD = 20;
    }else if(key == 'D'||key == 'd'){
      currentSelect = (currentSelect<2)?currentSelect+1:0;
      selectCD = 20;
    }
  }
  tint(230);
  image(player_bg,0,0); // 背景
  noTint();
  switch(currentSelect){
    case 0:
      image(cha_Aworkdown,365,128);// 下半身
      tint(100);
      image(cha_Bworkdown,480,128);
      image(cha_Cworkdown,583,138);
      noTint();
      image(player_table,322,269);// 桌子
      if(aniTimer%30<=15){// 上半身
        image(cha_Aworkup,365,128);
      }else{
        image(cha_Aworkup2,365,128);
      }
      tint(100);
      image(cha_Cworkup,583,138);
      image(cha_Bworkup,480,128);
      noTint();
      break;
    case 1:
      image(cha_Bworkdown,480,128);// 下半身
      tint(100);
      image(cha_Aworkdown,365,128);
      image(cha_Cworkdown,583,138);
      noTint();
      image(player_table,322,269);// 桌子
      if(aniTimer%30<=15){// 上半身
        image(cha_Bworkup,480,128);
      }else{
        image(cha_Bworkup2,480,128);
      }
      tint(100);
      image(cha_Aworkup,365,128);
      image(cha_Cworkup,583,138);
      noTint();
      break;
    case 2:
      image(cha_Cworkdown,583,138);// 下半身
      tint(100);
      image(cha_Bworkdown,480,128);
      image(cha_Aworkdown,365,128);
      noTint();
      image(player_table,322,269);// 桌子
      if(aniTimer%30<=15){// 上半身
        image(cha_Cworkup,583,138);
      }else{
        image(cha_Cworkup2,583,138);
      }
      tint(100);
      image(cha_Aworkup,365,128);
      image(cha_Bworkup,480,128);
      noTint();
      break;
  }
  
  image(skinchoose,478,34);// 提示文字
  
  //文字輸入框
  if(playerName.clicked()){
    playerName.typing = true;
  }
  if(!playerName.hovered() && mousePressed && playerName.typing){
    playerName.typing = false;
  }
  playerName.display("typename");
  textSize(18);
  fill(#E5BA9C);
  if(playerName.typing){ // 文字輸入處理
    if(keyIn!=0){
      if(keyIn == BACKSPACE && nameLength!=0){
        nameString = nameString.substring(0,nameString.length()-1);
        keyIn = 0;
        nameLength--;
      }else if(keyIn>=32 && keyIn<=126 && nameLength<=14){
        nameString = nameString + keyIn;
        keyIn = 0;
        nameLength++;
      }
    }
    if(frameCount%20<10){
      text(nameString+" ",836,307);
    }else{
      text(nameString+"|",836,307);
    }
  }else{
    text(nameString,836,307);
  }
  fill(255);
  
  Button startGame = new Button(819,335,173,52,start_play,start_play_hovered);
  if(nameString == ""){
    startGame.clickable = false;
  }else{
    startGame.clickable = true;
  }
  startGame.display();
  if(startGame.clicked()){
    player = new Player(currentSelect,nameString);
    initGame();
    gameState = "PLAYING";
  }
}


// 背包 選單 介面更新
void guiUpdate(){
  if(player.moveable && keyPressed && (key == 'b'||key == 'B') && bagOpenCD == 0){
    bagIsOpening = true;
    xHovered = 0;
    yHovered = 0;
    player.moveable = false;
    bagOpenCD = 15;
  }
  
  if(bagIsOpening && keyPressed && (key == 'b'||key == 'B') && bagOpenCD == 0){
    bagIsOpening = false;
    player.moveable = true;
    bagOpenCD = 15;
  }
}

// 背包 選單 介面顯示
void guiDisplay(){
  if(menuIsOpening){
    image(menu,0,0,60,60);
  }else{
    image(menuOpen,0,0,60,60);
  }
  
  if(bagIsOpening){
    fill(#535162,200);
    pushMatrix();
      translate(map(bagOpenCD,15,0,width,0),0);
      bagGui();
    popMatrix();
    //image(bagOpen,911,315,85,85);
    
  }else{
    fill(#535162,200);
    pushMatrix();
      translate(map(bagOpenCD,15,0,0,width),0);
      bagGui();
    popMatrix();
    //image(bag,911,315,85,85);
  }
}

// 背包介面
int xHovered = 0;
int yHovered = 0;
Dialogue itemInfo;
void bagGui(){
  rectMode(CORNER);
  rect(0,0,width,height);
  fill(#535162,255);
  rect(0,335,width,85);
  if(bagIsOpening){
    int count = 0;
    for(int o=0;o<2;o++){
      for(int i=0;i<9;i++){
        int x = 39 + 108*i;
        int y = 63 + 104*o;
        noStroke();
        fill(255,100);// 底部白格子
        rect(x,y,86,86,21);
        if((itemInfo==null || itemInfo.closed==true) && mouseX>x && mouseX<x+86 && mouseY>y && mouseY<y+86 && bagGuiCD==0){// 依照滑鼠更新白格子位置
          xHovered = i;
          yHovered = o;
          bagGuiCD = 5;
        }
        if(count<player.bag.size()){
          Item item = player.bag.get(count);// 取得玩家背包物件資料
          if(i == xHovered && o == yHovered){ // 判定是否為目前檢視的物件
            fill(255,190);
            rect(x,y,86,86,21);
            fill(255);
            textSize(20);
            text(item.name,46,354,130,50);// 物件名字
            //println(item.name + " xHovered=" + xHovered + " yHovered=" + yHovered);
            textSize(18);
            text(item.infoShort,176,354,705,50);// 物件短說明文字
          }
          image(item.smallImg,x,y,86,86);// 物件圖片
          
          if((itemInfo==null || itemInfo.closed==true) && mousePressed && i == xHovered && o == yHovered){//滑鼠點擊查看詳細訊息
            xHovered = -1;
            yHovered = -1;
            itemInfo = new Dialogue(item);
            itemInfo.closed = false;
          }
        }
        count++;
      }
    }
    if(itemInfo!=null && !itemInfo.closed){
      itemInfo.update();
      itemInfo.display();
    }
    player.moveable = false;
  }
}

void keyReleased(){
  if(playerName.typing){
    keyIn = key;
  }
}
