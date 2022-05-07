class Player { //<>//
  float x; //玩家在遊戲中的絕對座標
  float xOnScreen; // 玩家顯示在遊戲畫面上的座標
  String direction; //玩家的方向狀態（LEFT朝左、RIGHT朝右、BACK背對）
  String where; // 玩家目前所在場地（HALL 走廊、WORKING 手作室、CUTTING 切削室、GRINDING 研磨室、ADMIN 助教室）
  
  boolean moveable = true;

  Player() {
    x = 500;
    xOnScreen = width/2;
    direction = "LEFT";
    where = "HALL";
  }
  
  Player(float x,String where) {
    this.x = x;
    this.xOnScreen = width/2;
    this.direction = "LEFT";
    this.where = where;
  }

  void display() {
    rectMode(CENTER);
    rect(x, 350, 50, 50);
  }

  void move() {
    final float MOVING_AREA = 50; // 角色在畫面上的移動範圍寬度
    final float SCENE_PADDING = 100; // 角色在場景移動的左右邊界寬度
    if(moveable){
      if (keyPressed) {
        if (key == 'a' || key == 'A') {
          x -= 14;// 移動角色
          if (x<=SCENE_PADDING) { // 限制角色移動範圍在場景範圍內
            x = SCENE_PADDING;
          }
          direction = "LEFT";// 改變角色狀態
          xOnScreen -= 14;// 鏡頭控制
          if (xOnScreen <= width/2 - MOVING_AREA/2) {
            xOnScreen = width/2 - MOVING_AREA/2;
          }
        }
        if (key == 'd' || key == 'D') {
          x += 14;// 移動角色
          if (x >= sceneWidth - SCENE_PADDING) { // 限制角色移動範圍在場景範圍內
            x = sceneWidth - SCENE_PADDING;
          }
          direction = "RIGHT";// 改變角色狀態
          xOnScreen += 14;// 鏡頭控制
          if (xOnScreen >= width/2 + MOVING_AREA/2) {
            xOnScreen = width/2 + MOVING_AREA/2;
          }
        }
      }
    }
    
  }
  void doorInterect() {
    switch(where) {
    case "HALL":// 走廊通往各個教室
      if (x >= 790 && x <= 850) {
        enterDoor("HALL", "WORKING");
      }
      if (x >= 960 && x <= 1060) {
        enterDoor("HALL", "ADMIN");
      }
      if (x >= 1685 && x <= 1765) {
        enterDoor("HALL", "CUTTING");
      }
      if (x >= 2250 && x <= 2340) {
        enterDoor("HALL", "GRINDING");
      }
      break;
    case "WORKING":// 工作室回走廊
      if (x >= 1150 && x <= 1250) {
        enterDoor("WORKING", "HALL");
      }
      break;
    case "CUTTING":// 切削室回走廊
      if (x >= 430 && x <= 520) {
        enterDoor("CUTTING", "HALL");
      }
      break;
    case "GRINDING":// 研磨室回走廊 
      if (x >= 1115 && x <= 1205) {
        enterDoor("GRINDING", "HALL");
      }
      break;
    case "ADMIN": // 助教室回走廊
      if (x >= 110 && x <= 200) {
        enterDoor("ADMIN", "HALL");
      }
      break;
    }
  }
  void enterDoor(String from, String to) {
    if (keyPressed && (key == 'w' || key == 'W') && enterDoorCD == 0) {
      if (from == "HALL") {
        switch(to) {
        case "WORKING":
          x = 1200;
          break;
        case "CUTTING":
          x = 480;
          break;
        case "GRINDING":
          x = 1160;
          break;
        case "ADMIN":
          x = 155;
          break;
        }
      } else {
        switch(from) {
        case "WORKING":
          x = 835;
          break;
        case "CUTTING":
          x = 1730;
          break;
        case "GRINDING":
          x = 2300;
          break;
        case "ADMIN":
          x = 1015;
          break;
        }
      }
      where = to;
      enterDoorCD = 30;
    }
  }
}
