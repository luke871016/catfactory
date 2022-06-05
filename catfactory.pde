Player player;
PFont font;
String gameState = "START";

//ArrayList<Animation> AnimationArrayTest = new ArrayList<Animation>();

// 畫面遮罩變數
color blackMask = color(255);
// 遊戲圖片變數

void setup(){
  size(1024,420);
  background(0);
  loadGuiImg();
  loadSceneImg();
  loadPlayerImg();
  loadItemImg();
  //loadData();
  font = createFont("GenSenRoundedTW-R",23);
  
  blackMask = color(0,1);
}

void draw(){
  switch(gameState){
    case "START":
      homePage();
      break;
    case "PLAYER_SELECT":
      playerSelect();
      break;
    case "PLAYING":
      // # 物件計算    
      countDown(); // 各種計時的東西
      doorsUpdate();
      guiUpdate(); // 偵測打開選單、包包
      eventsUpdate(); // 事件更新
      player.move(); // 計算角色移動
      // # 物件顯示
      pushMatrix();
        cameraOffset();// 鏡頭捲動
        setCamera();// 設定鏡頭位置（事件開啟後使用）
        sceneLayer0();// 場景圖層0
        sceneLayer1();// 場景圖層1 
        player.display();// 玩家
        sceneLayer2();// 場景圖層2 (前景)
      popMatrix();
      // 事件圖片
      if(graphic != null){
        image(graphic,0,0);
      } 
      // 背包&選單圖示
      guiDisplay();
      // 對話文字&畫面遮罩
      blackMask();
      textDisplay();
      break;
  }
  
}

// 鏡頭位移
float cameraOffsetX;
void cameraOffset(){
  cameraOffsetX = player.xOnScreen - player.x; // 控制鏡頭移動的變數
  if(cameraOffsetX>=0){
    cameraOffsetX=0;
  }
  if(cameraOffsetX <= -sceneWidth+width){
    cameraOffsetX= -sceneWidth+width;
  }
  translate(cameraOffsetX,0);
}

float cameraX;
Boolean setCamera = false;
void setCamera(){
  if(setCamera){
    translate(-cameraOffsetX,0);
    translate(cameraX,0);
  }
}

void initGame(){
  initDoors();
  initEvents();
  saveData();
}

// 黑色遮罩
void blackMask(){
  fill(blackMask);
  rectMode(CORNER);
  rect(0,0,width,height);
}
