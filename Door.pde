Door workingDoor,adminDoor,cuttingDoor,grindingDoor;
Animation[] enterDoor;
Boolean setDoorAni;

void initDoors(){
  workingDoor = new Door('A',"WORKING","HALL",96,727);
  adminDoor = new Door('B',"ADMIN","HALL",1142,931);
  cuttingDoor = new Door('A',"CUTTING","HALL",51,1622);
  grindingDoor = new Door('A',"GRINDING","HALL",1104,2558);
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

void doorsUpdate(){
  // 進門判斷
  if(workingDoor.interect()){
    setDoorAni(workingDoor);
    workingDoor.playing = true;
  }
  if(adminDoor.interect()){
    setDoorAni(adminDoor);
    workingDoor.playing = true;
  }
  if(cuttingDoor.interect()){
    setDoorAni(cuttingDoor);
    workingDoor.playing = true;
  }
  if(grindingDoor.interect()){
    setDoorAni(grindingDoor);
    workingDoor.playing = true;
  }
  
  // 播放進門動畫
  if(workingDoor.playing || adminDoor.playing || cuttingDoor.playing || grindingDoor.playing){
    animationsUpdate(enterDoor);
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
      img = door_b_inside;
      img_open = open_door_b_inside;
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
    if(this.playerTouched()){
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
