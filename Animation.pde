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
            clickCD = 15;
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
        case "END":
          if(timer<90){
            fill(0,map(timer,0,90,0,255));
            rect(0,0,width,height);
            fill(255,map(timer,0,90,0,255));
            textAlign(CENTER);
            text("THE END",width/2,height/2);
          }else if(timer < 140){
            fill(0);
            rect(0,0,width,height);
            fill(255);
            textAlign(CENTER);
            text("THE END",width/2,height/2);
          }else {
            gameState = "START";
          }
          
          break;
        case "BLACK_CAT":
          //角色
          catcan.img = null;
          if(timer>15){
            player.x = 497.5;
            player.CGI = 0;
          }
          if(timer>60){
            player.CGI = 2;
          }
          if(timer>120){
            player.CGI = 1;
          }
          if(timer>150){
            player.CGI = 3;
          }
          if(timer>195){
            player.CGI = 4;
          }
          if(timer>250){
            player.CGI = 5;
          }
          if(timer>260){
            player.CGI = 7;
          }
          if(timer>290){
            player.CGI = 8;
          }
          if(timer>575){
            player.CGI = 9;
          }
          if(timer>750){
            player.CGI = 10;
          }
          if(timer>850){
            player.CGI = 11;
          }
          if(timer>950){
            player.CGI = 12;
          }
          
          //黑貓
          if(timer > 60 && timer < 90){
            tint(255,255,255,map(timer,60,90,0,255));
              image(reblackcat_blc[0],828,map(timer,60,90,225,281));
            noTint();
          }else if(timer > 60 && timer < 140){
            image(reblackcat_blc[0],828,281);
            tint(255,255,255,map(timer,60,140,0,255));
              image(reblackcat_blc[1],828,281);
            noTint();
          }else if(timer > 60 && timer < 150){
            image(reblackcat_blc[1],828,281);
          }else if(timer > 60 && timer < 240){
            image(reblackcat_blc[2],map(timer,150,240,797,667),map(timer,150,240,261,146),map(timer,150,240,151,295),map(timer,150,240,130,254));
          }else if(timer > 60 && timer < 245){
            image(reblackcat_blc[2],667,146,292,254);
          }else if(timer > 60 && timer < 545){
            image(reblackcat_blc[4],554,76);
          }else if(timer > 60 && timer < 575){
            image(reblackcat_blc[7],554,76);
          }else if(timer > 60 && timer < 590){
            tint(255,255,255,map(timer,575,590,255,0));
              image(reblackcat_blc[7],554,map(timer,575,590,76,46));
            noTint();
          }
          
          //橘貓
          if(timer > 260 && timer < 290){
            image(reblackcat_O[0],351,map(timer,260,290,-475,308));
          }else if(timer > 260 && timer < 650){
            image(reblackcat_O[0],351,308);
          }else if(timer > 260 && timer < 750){
            image(reblackcat_O[5],351,308);
          }else if(timer > 260 && timer < 850){
            image(reblackcat_O[2],348,182);
          }else if(timer > 260 && timer < 950){
            image(reblackcat_O[3],320,194);
          }else if(timer > 260 && timer < 1100){
            image(reblackcat_O[4],320,190);
          }
          
          //橘貓&黑貓特寫
          if(timer > 370 && timer < 400){
            tint(255,255,255,map(timer,370,400,0,255));
              image(reblackcat_O[1],map(timer,370,400,-82,42),13);
            noTint();
          }else if(timer > 370 && timer < 430){
            image(reblackcat_O[1],42,13);
          }else if(timer > 370 && timer < 460){
            tint(255,255,255,map(timer,430,460,255,1));
              image(reblackcat_O[1],map(timer,430,460,42,-82),13);
            noTint();
            tint(255,255,255,map(timer,430,460,0,255));
              image(reblackcat_blc[5],440,25);
            noTint();
          }else if(timer > 370 && timer < 530){
            image(reblackcat_blc[5],440,25);
          }else if(timer > 370 && timer < 545){
            tint(255,255,255,map(timer,530,545,255,1));
              image(reblackcat_blc[5],440,map(timer,530,545,25,0));
            noTint();
          }
          
          
          //畫面遮罩
          if(timer<15){
            fill(0,map(timer,0,15,0,255));
            rect(0,0,width,height);
          }else if(timer<30){
            fill(0,map(timer,15,30,255,0));
            rect(0,0,width,height);
          }
          
          if(timer > 230 && timer < 245){
            fill(255,map(timer,230,245,0,255));
            rect(0,0,width,height);
          }else if(timer > 230 && timer < 260){
            fill(255,map(timer,245,260,255,0));
            rect(0,0,width,height);
          }
          
          if(timer > 530 && timer < 545){
            fill(255,map(timer,530,545,0,255));
            rect(0,0,width,height);
          }else if(timer > 530 && timer < 560){
            fill(255,map(timer,545,560,255,1));
            rect(0,0,width,height);
          }
          
          if(timer > 590 && timer < 650){
            fill(255,map(timer,590,650,0,255));
            rect(0,0,width,height);
          }else if(timer > 590 && timer < 710){
            fill(255,map(timer,650,710,255,1));
            rect(0,0,width,height);
          }
          
          if(timer > 720 && timer < 750){
            fill(255,map(timer,720,750,0,255));
            rect(0,0,width,height);
          }else if(timer > 720 && timer < 780){
            fill(255,map(timer,750,780,255,1));
            rect(0,0,width,height);
          }
          
          if(timer > 820 && timer < 850){
            fill(255,map(timer,820,850,0,255));
            rect(0,0,width,height);
          }else if(timer > 820 && timer < 880){
            fill(255,map(timer,850,880,255,1));
            rect(0,0,width,height);
          }
          
          if(timer > 920 && timer < 950){
            fill(255,map(timer,920,950,0,255));
            rect(0,0,width,height);
          }else if(timer > 920 && timer < 980){
            fill(255,map(timer,950,980,255,1));
            rect(0,0,width,height);
          }
          
          //if(timer > 1020 && timer < 1080){
          //  fill(0,map(timer,1021,1080,0,255));
          //  rect(0,0,width,height);
          //}
          
          //運鏡設定
          if(timer >15 && timer < 40){
            setCamera = true;
            cameraX = map(timer,13,40,-155,-308);
          }else{
            cameraX = -308;
          }
          
          if(timer > duration-60 && timer < duration-30){
            fill(0,map(timer,duration-60,duration-30,0,255));
            rect(0,0,width,height);
          }else if(timer > duration-60 && timer < duration){
            orangecat = new Event(orangecatSit,"ADMIN",620,186,91,91);
            orangecat.stage = 2;
            println(1);
            player.direction = "RIGHT";
            blackMask = color(0);
            player.CGI = -1;
            setCamera = false;
            fill(0,map(timer,330,360,255,0));
            rect(0,0,width,height);
          }
          break;
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
        case "PU_TURNING":
          if(timer<240){
            if(timer%20 < 10){
              image(pu_turning[1],0,0);
            }else{
              image(pu_turning[0],0,0);
            }
          }else if(timer==240){
            image(pu_turning[2],0,0);
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
          
          float c = map(timer,0,10,255,0);
          if(c<1)c=1;
          fill(color(0,c));
          rect(0,0,width,height);
          break;
        case "PU_CUTTING":
          if(timer<60){
            image(pu_cutting[0],0,0);
          }else if(timer<110){
            image(pu_cutting[1],0,0);
          }else if(timer<=180){
            image(pu_cutting[2],0,0);
          }else if(timer<240){
            image(pu_cutting[3],0,0);
          }else if(timer==240){
            image(pu_cutting[3],0,0);
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
          
          float b = map(timer,0,10,255,0);
          if(b<1)b=1;
          fill(color(0,b));
          rect(0,0,width,height);
          break;
        case "PU_BLACK":
          //角色
          if(timer>15){
            player.x = 556;
            player.direction = "PU1";
          }
          if(timer>170){
            player.direction = "PU4";
          }
          if(timer>210){
            player.direction = "PUBLACK";
          }
          
          //黑貓
          if(timer > 40 && timer <= 100){
            tint(255,255,255,map(timer,40,100,0,255));
            if(timer % 20 < 10){
              image(blackCat1,528,229 + sin(frameCount/10.0)*5);
            }else{
              image(blackCat2,528,229 + sin(frameCount/10.0)*5);
            }
            noTint();
          }else if(timer > 40 && timer<170){
            if(timer % 20 < 10){
              image(blackCat1,528,229 + sin(frameCount/10.0)*5);
            }else{
              image(blackCat2,528,229 + sin(frameCount/10.0)*5);
            }
          }else if(timer > 40 && timer<210){
            tint(255,255,255,map(timer,170,210,255,0));
            if(timer % 20 < 10){
              image(blackCat1,map(timer,170,220,528,-2528),229 + sin(frameCount/10.0)*5);
            }else{
              image(blackCat2,map(timer,170,220,528,-2528),229 + sin(frameCount/10.0)*5);
            }
            noTint();
          }
          
          //運鏡設定
          if(timer >15 && timer < 40){
            setCamera = true;
            cameraX = map(timer,13,40,-356,-306);
          }else{
            cameraX = -306;
          }
          
          //畫面遮罩
          if(timer<15){
            fill(0,map(timer,0,15,0,255));
            rect(0,0,width,height);
          }else if(timer<30){
            fill(0,map(timer,15,30,255,0));
            rect(0,0,width,height);
          }
          
          if(timer > 170 && timer < 210){
            fill(255,map(timer,170,210,0,255));
            rect(0,0,width,height);
          }else if(timer > 170 && timer < 240){
            fill(255,map(timer,210,240,255,0));
            rect(0,0,width,height);
          }
          
          if(timer > 300 && timer < 330){
            fill(0,map(timer,300,330,0,255));
            rect(0,0,width,height);
          }else if(timer > 300 && timer < 360){
            player.direction = "RIGHT";
            setCamera = false;
            fill(0,map(timer,330,360,255,0));
            rect(0,0,width,height);
          }
          
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
