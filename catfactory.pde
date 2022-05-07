Player player;
//ArrayList<Text> textList = new ArrayList<Text>();
Text txt,txt2;
void setup(){
  size(1024,420);
  background(0);
  loadData();
  loadBGI();
  font = createFont("GenSenRoundedTW-R",23);
}

void draw(){
  // # 物件計算
  countDown(); // 各種計時的東西
  player.move(); // 計算角色移動
  player.doorInterect(); // 角色與門的互動（按下w進門)
  
  // # 物件顯示
  pushMatrix();
    cameraOffset();// 鏡頭捲動
    drawBackground();// 背景
    player.display();// 玩家
  popMatrix();
  
  txt.display();
  txt2.display();
  
  saveData();
}

void cameraOffset(){
  float cameraOffsetX = player.xOnScreen - player.x; // 控制鏡頭移動的變數
  if(cameraOffsetX>=0){
    cameraOffsetX=0;
  }
  if(cameraOffsetX <= -sceneWidth+width){
    cameraOffsetX= -sceneWidth+width;
  }
  
  translate(cameraOffsetX,0);
}
