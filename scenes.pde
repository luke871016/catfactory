// 場景圖片變數
PImage hallImg;
PImage workingImg;
PImage cuttingImg;
PImage grindingImg;
PImage adminImg;

// 載入圖片
void loadBGI(){
  hallImg = loadImage("img/background/hall.jpg");
  workingImg = loadImage("img/background/working.jpg");
  cuttingImg = loadImage("img/background/cutting.jpg");
  grindingImg = loadImage("img/background/grinding.jpg");
  adminImg = loadImage("img/background/admin.jpg");
}

// 場景的寬度數字
float sceneWidth;//儲存目前的場景寬度（用於控制鏡頭移動以及限制角色移動範圍）
final float HALL_WIDTH = 3709;
final float WORKING_WIDTH = 1330;
final float CUTTING_WIDTH = 1330;
final float GRINDING_WIDTH = 1330;
final float ADMIN_WIDTH = 1330;

// 繪製背景
void drawBackground(){
  switch(player.where){
    case "HALL":
      sceneWidth = HALL_WIDTH;
      image(hallImg,0,0,sceneWidth,420);
      break;
    case "WORKING":
      sceneWidth = WORKING_WIDTH;
      image(workingImg,0,0,sceneWidth,420);
      break;
    case "CUTTING":
      sceneWidth = CUTTING_WIDTH;
      image(cuttingImg,0,0,sceneWidth,420);
      break;
    case "GRINDING":
      sceneWidth = GRINDING_WIDTH;
      image(grindingImg,0,0,sceneWidth,420);
      break;
    case "ADMIN":
      sceneWidth = ADMIN_WIDTH;
      image(adminImg,0,0,sceneWidth,420);
      break;
  }
}
