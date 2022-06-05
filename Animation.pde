// 所有需要動畫時間的物件

class Animation{
  String type; // 動畫類型
  int duration = 0; //動畫長度
  float timer = 0; //動畫計時器
  Boolean play = false;// 播放開關
  Boolean closed = false;//動畫是否已播放完畢
  Boolean clickToClose = false;// 是否要等待滑鼠點擊才結束 (true：動畫播完要滑鼠點完才結束，false：動畫自動結束)
  Door door;
  String itemname;
  
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
  // 適用於玩家遺失物件
  Animation(String type,String itemname){
    this.type = type;
    this.duration = 1;
    this.itemname = itemname;
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
      if(timer >= duration){
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
          if(door != null){
            door.playerMove();
          }else{
            player.where = target;
            player.x = targetX;
          }
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
        case "GET_ITEM":
          player.getItem(item);
          break;
        case "LOSE_ITEM":
          player.removeItem(itemname);
          break;
        case "BOX_MAKING":
          break;
          
      }
      
      //動畫結束控制
      if(timer == duration){
        if(clickToClose){
          if(mousePressed){
            player.moveable = true;
            closed = true;
          }
        }else{
          player.moveable = true;
          closed = true;
        }
      }
      if(!closed){
        player.moveable = false;
      }
    }
  }
  
  void display(){
    if(!closed){
      switch(type){
        case "BOX_MAKING":
          if(timer<150){
            image(cube_making[0],0,0);
            image(cube_hand,map(sin(frameCount/10.0),1,-1,590,528),map(sin(frameCount/10.0),1,-1,12,103));
            if(timer>120){
              fill(255,map(timer,120,150,0,255));
              rect(0,0,width,height);
            }
          }else if(timer<180){
            image(cube_making[2],0,0);
            if(timer<165){
              fill(255,map(timer,150,165,255,0));
              rect(0,0,width,height);
            }
          }else if(timer<=210){
            image(cube_making[2],0,0);
            fill(255,map(timer,180,210,0,255));
            rect(0,0,width,height);
          }else if(timer<240){
            image(cube_making[4],0,0);
            fill(255,map(timer,210,240,255,1));
            rect(0,0,width,height);
          }else if(timer==240){
            image(cube_making[4],0,0);
          }
          fill(#545163);
          rect(371.5,341,282,36);
          fill(#A37D89);
          rect(371.5,341,map(timer,0,duration,0,282),36);
          
          image(cgmask,0,0);
          
          fill(255);
          textAlign(CENTER);
          if(timer<240){
            text("製作中...",width/2,height-20);
          }else{
            text("製作完成！",width/2,height-20);
          }
          textAlign(LEFT);
          
          if(timer == 240){
            image(textend,963,375,35,23);
          }
          
          float a = map(timer,0,10,255,0);
          if(a<1)a=1;
          fill(color(0,a));
          rect(0,0,width,height);
          break;
        case "PU_ANI":
          // 貓咪特寫
          if(timer > 210 && timer <= 230){
            tint(255,255,255,int(map(timer,210,230,0,255)));
            image(orangecat_pu[1],451,map(timer,210,230,-50,27));
            noTint();
          }else if(timer > 230 && timer <= 280){
            image(orangecat_pu[1],451,27);
          }
          
          // 喵對話框
          if(timer > 30 && timer <= 60){
            image(orangecat_pu[0],map(timer,30,60,1124,785),140);
          }else if(timer > 30 && timer <= 140){
            image(orangecat_pu[0],785,140);
          }else if(timer > 30 && timer<=160){
            tint(255,255,255,int(map(timer,140,160,255,0)));
            image(orangecat_pu[0],785,140);
            noTint();
          }
          
          // 小咪圖片
          if(timer > 80 && timer <=210){
            if(timer % 20 <= 10){
              image(orangecatLeft1,map(timer,40,210,1230,435),295);
            }else{
              image(orangecatLeft2,map(timer,40,210,1230,435),295);
            }
          }else if(timer > 80 && timer < 280){
            image(orangecatLeft1,435,295);
          }else if(timer > 80 && timer < 390){
            image(orangecat_pu[2],262,224);
          }else if(timer > 80 && timer < duration){
            orangecat.stage = 0;
          }
          
          // 玩家表情
          if(timer >=12 && timer <= 130){
            pu.img = null;
            player.direction = "PU1";
          }else if(timer >=12 && timer <= 190){
            player.direction = "PU2";
          }else if(timer >=12 && timer <= 280){
            player.direction = "PU3";
          }else if(timer >=12 && timer <= 390){
            player.direction = "PU4";
          }else if(timer >=12 && timer <= duration){
            player.direction = "PU5";
          }
          
          // 運鏡設定
          if(timer >=12 && timer < 40){
            setCamera = true;
            cameraX = map(timer,13,40,-2624,-2724);
          }else{
            cameraX = -2724;
          }
          
          if(timer >= duration-3){
            blackMask = color(0);
            setCamera = false;
            player.direction = "RIGHT";
            player.yOffset = 0;
            cameraX = 0;
          }
          // 畫面遮罩
          if(timer<=15){
            fill(0,map(timer,0,15,0,255));
            rect(0,0,width,height);
          }else if(timer<=30){
            player.x = 2843;
            player.yOffset = -14;
            fill(0,map(timer,15,30,255,1));
            rect(0,0,width,height);
          }else if(timer >= 270 && timer <=280){
            fill(255,map(timer,270,280,0,255));
            rect(0,0,width,height);
          }else if(timer >= 280 && timer <=290){
            fill(255,map(timer,280,290,255,1));
            rect(0,0,width,height);
          }
          else if(timer >= 370 && timer <=390){
            fill(255,map(timer,370,387,0,255));
            rect(0,0,width,height);
          }else if(timer >= 390 && timer <=440){
            fill(255,map(timer,387,440,255,1));
            rect(0,0,width,height);
          }
          if(timer >= 470){
            fill(0,map(timer,470,495,0,255));
            rect(0,0,width,height);
          }
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
