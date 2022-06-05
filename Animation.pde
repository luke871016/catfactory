// 所有需要動畫時間的物件

class Animation{
  String type; // 動畫類型
  int duration = 0; //動畫長度
  float timer = 0; //動畫計時器
  Boolean play = false;// 播放開關
  Boolean closed = false;//動畫是否已播放完畢
  Boolean clickToClose = false;// 是否要等待滑鼠點擊才結束 (true：動畫播完要滑鼠點完才結束，false：動畫自動結束)
  Door door;
  
  // 玩家移動事件變數
  String target; // 玩家移動目的（只有 type == "PLAYER_MOVE" 時才有作用）
  float targetX;
  
  // 顯示圖片變數
  PImage image = null;
  
  // 取得物件變數
  Item item;
  
  //----各種建構式----
  Animation(){
    
  }
  
  // 適用於黑色淡入淡出、純等待的建構式
  Animation(String type,int duration,Boolean clickToClose){
    this.type = type;
    this.duration = duration;
    this.clickToClose = clickToClose;
  }
  
  // 適用於顯示圖片的建構式
  Animation(String type, PImage image){
    this.type = type;
    this.duration = 1;
    this.image = image;
  }
  
  // 適用於玩家移動的建構式
  Animation(String type,String target,float targetX){
    this.type = type;
    this.target = target;
    this.duration = 1;
    this.targetX = targetX;
  }
  
  // 適用於玩家取得物件
  Animation(String type,Item item){
    this.type = type;
    this.duration = 1;
    this.item = item;
  }
  
  // 適用於門相關動畫
  Animation(String type,Door door){
    this.type = type;
    if(type == "DOOR_OPEN"){
      this.duration = 15;
    }else if(type == "PLAYER_MOVE"){
      this.duration = 1;
    }else if(type == "DOOR_CLOSE"){
      this.duration = 1;
    }
    this.door = door;
  }
  
  //----更新、顯示----
  void update(){
    if(!closed){
      // 動畫播放更新
      timer ++;
      if(timer == duration){
        timer = duration;
      }
      switch(type){
        case "BLACK_FADE_IN":
          blackMask = color(0,map(timer,0,duration,1,255));
          break;
        case "BLACK_FADE_OUT":
          blackMask = color(0,map(timer,0,duration,255,1));
          break;
        case "PLAYER_MOVE":
          door.playerMove();
          break;
        case "DOOR_OPEN":
          player.y = PLAYERY_INIT - timer;
          door.open = true;
          player.direction = "BACK";
          break;
        case "DOOR_CLOSE":
          player.y = PLAYERY_INIT;
          door.open = false;
          player.direction = "LEFT";
          break;
        case "IMAGE_SHOW":
          graphic = this.image;
          break;
        case "GEI_ITEM":
          player.getItem(item);
          break;
      }
      
      //動畫結束控制
      if(timer == duration){
        player.moveable = true;
        closed = true;
      }
      if(!closed){
        player.moveable = false;
      }
    }
  }
  
  void display(){
    if(!closed){
      switch(type){
        case "BLACK_FADE_IN":
          break;
        case "BLACK_FADE_OUT":
          break;
        case "PLAVER_MOVE":
          break;
      }
    }
  }
}

//----動畫串函數----

//更新動畫
void animationsUpdate(Animation[] animations){
  for(int i=0;i<animations.length;i++){
    if(!animations[i].closed){
      animations[i].update();
      break;
    }
  }
}

//播放動畫
void animationsDisplay(Animation[] animations){
  for(int i=0;i<animations.length;i++){
    if(!animations[i].closed){
      animations[i].display();
      break;
    }
  }
  
}

//重設動畫
void animationsReset(Animation[] animations){
  for(int i=0;i<animations.length;i++){
    animations[i].closed = false;
    animations[i].timer = 0;
  }
}

// 動畫是否播放完畢
Boolean animationsDone(Animation[] animations){
  for(int i=0;i<animations.length;i++){
    if(!animations[i].closed){
      return false;
    }
  }
  return true;
}
