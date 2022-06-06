Door workingDoor,adminDoor,cuttingDoor,grindingDoor,elevator;
Animation[] workingDoorAni,workingDoorAni2,adminDoorAni,adminDoorAni2,adminDoorAni3,adminDoorAni4,cuttingDoorAni,cuttingDoorAni2,grindingDoorAni,grindingDoorAni2;
Animation[] elevatorAni,elevatorAni2;
Animation[] enterDoor;
Boolean setDoorAni;

void initDoors(){
  elevator = new Door('C',"HALL","HALL",3446,3446);
  workingDoor = new Door('A',"WORKING","HALL",96,727);
  adminDoor = new Door('B',"ADMIN","HALL",1142,931);
  cuttingDoor = new Door('A',"CUTTING","HALL",51,1622);
  grindingDoor = new Door('A',"GRINDING","HALL",1104,2558);
  
  elevatorAni = new Animation[2];
  elevatorAni[0] = new Dialogue(player.face1,player.name,"電梯需要刷學生證才可以使用");
  elevatorAni[1] = new Dialogue(player.face2,player.name,"可惜我學生證沒有放在身上");
  
  elevatorAni2 = new Animation[2];
  elevatorAni2[0] = new Dialogue(player.face1,player.name,"刷了這張學生證，我就能離開這個奇怪的工廠了對吧");
  elevatorAni2[1] = new Animation("END",150,false);
    
  workingDoorAni = new Animation[1];
  workingDoorAni[0] = new Dialogue(player.face1,player.name,"手作室的門是鎖著的，打不開");
  
  adminDoorAni = new Animation[2];
  adminDoorAni[0] = new Dialogue(player.face1,player.name,"助教室的門是鎖著的，打不開");
  adminDoorAni[1] = new Dialogue(player.face1,player.name,"密碼鎖的樣式跟平常不太一樣，似乎變成一種較為單純的密碼鎖");
  
  adminDoorAni2 = new Animation[2];
  adminDoorAni2[0] = new Dialogue(player.face1,player.name,"把封扣方盒上面的數字輸入看看...");
  adminDoorAni2[1] = new Dialogue(player.face1,player.name,"沒有成功解鎖呢...");
  
  adminDoorAni3 = new Animation[2];
  adminDoorAni3[0] = new Dialogue(player.face1,player.name,"把相機上面浮現的數字輸入看看...");
  adminDoorAni3[1] = new Dialogue(player.face1,player.name,"沒有成功解鎖呢...");
  
  adminDoorAni4 = new Animation[4];
  adminDoorAni4[0] = new Dialogue(player.face1,player.name,"把封扣方盒和相機上面的數字的不同種排列都嘗試看看吧...");
  adminDoorAni4[1] = new Dialogue(player.face2,player.name,"誒....?");
  adminDoorAni4[2] = new Dialogue(player.face2,player.name,"好像解鎖成功了耶");
  adminDoorAni4[3] = new Dialogue("系統提示","助教室的門解鎖了");
  
  workingDoorAni2 = new Animation[2];
  workingDoorAni2[0] = new Dialogue(player.face1,player.name,"用鑰匙打開手做室吧");
  workingDoorAni2[1] = new Dialogue("系統提示","手做室的門解鎖了");
  
  cuttingDoorAni = new Animation[1];
  cuttingDoorAni[0] = new Dialogue(player.face1,player.name,"切割室的門是鎖著的，打不開");
  
  cuttingDoorAni2 = new Animation[2];
  cuttingDoorAni2[0] = new Dialogue(player.face1,player.name,"我記得這裡的門可以用扁平的東西撬開");
  cuttingDoorAni2[1] = new Dialogue("系統提示","你用鐵撬把切削室的門撬開了");
  
  grindingDoorAni = new Animation[1];
  grindingDoorAni[0] = new Dialogue(player.face1,player.name,"研磨室的門是鎖著的，打不開");
  
  grindingDoorAni2 = new Animation[2];
  grindingDoorAni2[0] = new Dialogue(player.face1,player.name,"我記得這裡的門可以用扁平的東西撬開");
  grindingDoorAni2[1] = new Dialogue("系統提示","你用鐵撬把切削室的門撬開了");
}

void setDoorAni(Door door){
  enterDoor = new Animation[6];
  enterDoor[0] = new Animation("DOOR_OPEN",door);
  enterDoor[1] = new Animation("BLACK_FADE_IN",15,false);
  enterDoor[2] = new Animation("PLAYER_MOVE",door);
  enterDoor[3] = new Animation("WAITING",30,false);
  enterDoor[4] = new Animation("DOOR_CLOSE",door);
  enterDoor[5] = new Animation("BLACK_FADE_OUT",15,false);
}

Boolean enter = false;
// 門的對話顯示
void doorsDialogue(){
  if(elevator.playing){
    if(elevator.stage==0){
      animationsDisplay(elevatorAni);
    }
    if(elevator.stage==1){
      animationsDisplay(elevatorAni2);
    }
  }
  
  if(workingDoor.playing){
    if(workingDoor.stage==0){
      animationsDisplay(workingDoorAni);
    }
    if(workingDoor.stage==1){
      animationsDisplay(workingDoorAni2);
    }
  }
  if(adminDoor.playing){
    if(adminDoor.stage==0){
      animationsDisplay(adminDoorAni);
    }
    if(adminDoor.stage==1){
      animationsDisplay(adminDoorAni2);
    }
    if(adminDoor.stage==2){
      animationsDisplay(adminDoorAni3);
    }
    if(adminDoor.stage==3){
      animationsDisplay(adminDoorAni4);
    }
  }
  if(cuttingDoor.playing){
    if(cuttingDoor.stage==0){
      animationsDisplay(cuttingDoorAni);
    }
    if(cuttingDoor.stage==1){
      animationsDisplay(cuttingDoorAni2);
    }
  }
  if(grindingDoor.playing){
    if(grindingDoor.stage==0){
      animationsDisplay(grindingDoorAni);
    }
    if(grindingDoor.stage==1){
      animationsDisplay(grindingDoorAni2);
    }
  }
}

void doorsUpdate(){
  // 進門判斷
  if(!elevator.playing && elevator.interect()){
    if(elevator.stage == 0){
      animationsReset(elevatorAni);
      elevator.playing = true;
      if(player.have("學生證")){
        elevator.stage = 1;
      }
    }
  }
  
  if(enterDoorCD == 0){
    if(workingDoor.interect()){
      if(workingDoor.stage == 0){
        animationsReset(workingDoorAni);
        workingDoor.playing = true;
        if(player.have("手作室鑰匙")){
          workingDoor.stage = 1;
        }
      }else{
        setDoorAni(workingDoor);
        workingDoor.playing = true;
        enter = true;
        enterDoorCD = 60;
      }
    }
    if(adminDoor.interect()){
      if(adminDoor.stage != 3){
        animationsReset(adminDoorAni);
        animationsReset(adminDoorAni2);
        animationsReset(adminDoorAni3);
        adminDoor.playing = true;
        if(player.have("封扣方盒")){
          adminDoor.stage = 1;
        }
        if(player.have("EK相機模型")){
          adminDoor.stage = 2;
        }
        if(player.have("封扣方盒")&&player.have("EK相機模型")){
          adminDoor.stage = 3;
        }
      }else if(adminDoor.stage == 3){
        setDoorAni(adminDoor);
        adminDoor.playing = true;
        enter = true;
        enterDoorCD = 60;
      }
    }
    if(cuttingDoor.interect()){
      if(cuttingDoor.stage == 0){
        animationsReset(cuttingDoorAni);
        cuttingDoor.playing = true;
        if(player.have("鐵撬")){
          cuttingDoor.stage = 1;
        }
      }else{
        setDoorAni(cuttingDoor);
        cuttingDoor.playing = true;
        enter = true;
        enterDoorCD = 60;
      }
    }
    if(grindingDoor.interect()){
      if(grindingDoor.stage == 0){
        animationsReset(grindingDoorAni);
        grindingDoor.playing = true;
        if(player.have("鐵撬")){
          grindingDoor.stage = 1;
        }
      }else{
        setDoorAni(grindingDoor);
        grindingDoor.playing = true;
        enter = true;
        enterDoorCD = 60;
      }
    }
  }
  // 進門事件更新
  if(elevator.playing){
    if(elevator.stage==0){
      animationsUpdate(elevatorAni);
      if(animationsDone(elevatorAni)){
        println(1);
        elevator.playing = false;
      }
    }
    if(elevator.stage==1){
      animationsUpdate(elevatorAni2);
      if(animationsDone(elevatorAni2)){
        elevator.playing = false;
      }
    }
  }
  if(workingDoor.playing){
    if(workingDoor.stage==0){
      animationsUpdate(workingDoorAni);
      if(animationsDone(workingDoorAni)){
        workingDoor.playing = false;
      }
    }
    if(workingDoor.stage==1){
      animationsUpdate(workingDoorAni2);
      if(animationsDone(workingDoorAni2)){
        workingDoor.playing = false;
      }
    }
  }
  if(adminDoor.playing){
    if(adminDoor.stage==0){
      animationsUpdate(adminDoorAni);
      if(animationsDone(adminDoorAni)){
        adminDoor.playing = false;
      }
    }
    if(adminDoor.stage==1){
      animationsUpdate(adminDoorAni2);
      if(animationsDone(adminDoorAni2)){
        adminDoor.playing = false;
      }
    }
    if(adminDoor.stage==2){
      animationsUpdate(adminDoorAni3);
      if(animationsDone(adminDoorAni3)){
        adminDoor.playing = false;
      }
    }
    if(adminDoor.stage==3){
      animationsUpdate(adminDoorAni4);
      if(animationsDone(adminDoorAni4)){
        adminDoor.playing = false;
      }
    }
  }
  if(cuttingDoor.playing){
    if(cuttingDoor.stage==0){
      animationsUpdate(cuttingDoorAni);
      if(animationsDone(cuttingDoorAni)){
        cuttingDoor.playing = false;
      }
    }
    if(cuttingDoor.stage==1){
      println(3);
      animationsUpdate(cuttingDoorAni2);
      if(animationsDone(cuttingDoorAni2)){
        cuttingDoor.playing = false;
      }
    }
  }
  if(grindingDoor.playing){
    if(grindingDoor.stage==0){
      animationsUpdate(grindingDoorAni);
      if(animationsDone(grindingDoorAni)){
        grindingDoor.playing = false;
      }
    }
    if(grindingDoor.stage==1){
      animationsUpdate(grindingDoorAni2);
      if(animationsDone(grindingDoorAni2)){
        grindingDoor.playing = false;
      }
    }
  }
  
  
  // 播放進門動畫
  if(enter){
    animationsUpdate(enterDoor);
    if(animationsDone(enterDoor)){
      workingDoor.playing = false;
      adminDoor.playing = false;
      cuttingDoor.playing = false;
      grindingDoor.playing = false;
      enter = false;
    }
    animationsDisplay(enterDoor);
  }
}

class Door extends Event{
  float x2;
  String where2;
  PImage img2;
  PImage img_open;
  PImage img2_open;
  PImage displayImg;
  int timer = 0;
  Boolean open = false;
  Door(char type,String where,String where2,float x,float x2){
    this.where = where;
    this.where2 = where2;
    this.x = x;
    this.x2 = x2;
    y = 93;
    this.x2 = x2;
    if(type == 'A'){
      img2 = door_a;
      img2_open = open_door_a;
      img = door_a_inside;
      img_open = open_door_a_inside;
      w = 164;
      h = 242;
    }else if(type == 'B'){
      img2 = door_b;
      img2_open = open_door_b;
      img = open_door_b_inside;
      img_open = open_door_b_inside;
      w = 126;
      h = 242;
    }else if(type == 'C'){
      img2 = elevator_open;
      img2_open = elevator_open;
      img = elevator_open;
      img_open = elevator_open;
      w = 126;
      h = 242;
    }
  }
  
  void display(){
    fill(0,40);
    if(this.where == player.where){
      displayImg = img;
      if(open){
        displayImg = img_open;
      }
      image(displayImg,x,y);
    }else if(this.where2 == player.where){
      displayImg = img2;
      if(open){
        displayImg = img2_open;
      }
      image(displayImg,x2,y);
    }
  }
  void update(){
    
  }
  
  Boolean interect(){
    if(this.playerTouched() && player.moveable){
      if(keyPressed && (key == 'w' || key == 'W') && enterDoorCD == 0){
        return true;
      }
    }
    return false;
  }
  
  Boolean playerTouched(){
    if(player.where==this.where){
      if(player.x>=this.x && player.x<=this.x+this.w){
        return true;
      }
    }else if(player.where==this.where2){
      if(player.x>=this.x2 && player.x<=this.x2+this.w){
        return true;
      }
    }
    
    return false;
  }
  
  // 進門移動與轉換場景
  
  void playerMove(){
    if(player.where == this.where){
      player.where = this.where2;
      player.x = this.x2+this.w/2;
    }else if (player.where == this.where2){
      player.where = this.where;
      player.x = this.x+this.w/2;
    }
    enterDoorCD = 15;
  }
}
