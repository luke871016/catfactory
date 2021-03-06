PImage cha_Aleft,cha_Aleft2,cha_Aright,cha_Aright2,cha_Aback,cha_Abackblack; //<>//
PImage cha_Aworkup,cha_Aworkup2,cha_Aworkdown,cha_Aworkblack_up,cha_Aworkblack_down;
PImage cha_Bleft,cha_Bleft2,cha_Bright,cha_Bright2,cha_Bback,cha_Bbackblack;
PImage cha_Bworkup,cha_Bworkup2,cha_Bworkdown,cha_Bworkblack_up,cha_Bworkblack_down;
PImage cha_Cleft,cha_Cleft2,cha_Cright,cha_Cright2,cha_Cback,cha_Cbackblack;
PImage cha_Cworkup,cha_Cworkup2,cha_Cworkdown,cha_Cworkblack_up,cha_Cworkblack_down;
PImage face_A1,face_A2,face_A3,face_B1,face_B2,face_B3,face_C1,face_C2,face_C3,face_orangecat;
PImage orangecat_pu_a,orangecat_pu_a2,orangecat_pu_a3,orangecat_pu_a4,orangecat_pu_a5,orangecat_pu_b,
orangecat_pu_b2,orangecat_pu_b3,orangecat_pu_b4,orangecat_pu_b5,orangecat_pu_c,orangecat_pu_c2,
orangecat_pu_c3,orangecat_pu_c4,orangecat_pu_c5,orangecat_pu_a_black,orangecat_pu_b_black,orangecat_pu_c_black;

PImage[] rcA,rcB,rcC;

void loadPlayerImg(){
  rcA = new PImage[13];
  for(int i=0;i<13;i++){
     rcA[i] = loadImage("img/CG/reblackcat/reblackcat_A"+(i+1)+".png");
  }
  rcB = new PImage[13];
  for(int i=0;i<13;i++){
     rcB[i] = loadImage("img/CG/reblackcat/reblackcat_B"+(i+1)+".png");
  }
  rcC = new PImage[13];
  for(int i=0;i<13;i++){
     rcC[i] = loadImage("img/CG/reblackcat/reblackcat_C"+(i+1)+".png");
  }
  
  orangecat_pu_a_black = loadImage("img/CG/orangecat/orangecat_pu_a_black.png");
  orangecat_pu_b_black = loadImage("img/CG/orangecat/orangecat_pu_b_black.png");
  orangecat_pu_c_black = loadImage("img/CG/orangecat/orangecat_pu_c_black.png");
  orangecat_pu_a = loadImage("img/CG/orangecat/orangecat_pu_a.png");
  orangecat_pu_a2 = loadImage("img/CG/orangecat/orangecat_pu_a2.png");
  orangecat_pu_a3 = loadImage("img/CG/orangecat/orangecat_pu_a3.png");
  orangecat_pu_a4 = loadImage("img/CG/orangecat/orangecat_pu_a4.png");
  orangecat_pu_a5 = loadImage("img/CG/orangecat/orangecat_pu_a5.png");
  orangecat_pu_b = loadImage("img/CG/orangecat/orangecat_pu_b.png");
  orangecat_pu_b2 = loadImage("img/CG/orangecat/orangecat_pu_b2.png");
  orangecat_pu_b3 = loadImage("img/CG/orangecat/orangecat_pu_b3.png");
  orangecat_pu_b4 = loadImage("img/CG/orangecat/orangecat_pu_b4.png");
  orangecat_pu_b5 = loadImage("img/CG/orangecat/orangecat_pu_b5.png");
  orangecat_pu_c = loadImage("img/CG/orangecat/orangecat_pu_c.png");
  orangecat_pu_c2 = loadImage("img/CG/orangecat/orangecat_pu_c2.png");
  orangecat_pu_c3 = loadImage("img/CG/orangecat/orangecat_pu_c3.png");
  orangecat_pu_c4 = loadImage("img/CG/orangecat/orangecat_pu_c4.png");
  orangecat_pu_c5 = loadImage("img/CG/orangecat/orangecat_pu_c5.png");
  
  face_orangecat = loadImage("img/face/face_orangecat.png");
  face_A1 = loadImage("img/face/face_A1.png");
  face_A2 = loadImage("img/face/face_A2.png");
  face_A3 = loadImage("img/face/face_A3.png");
  face_B1 = loadImage("img/face/face_B1.png");
  face_B2 = loadImage("img/face/face_B2.png");
  face_B3 = loadImage("img/face/face_B3.png");
  face_C1 = loadImage("img/face/face_C1.png");
  face_C2 = loadImage("img/face/face_C2.png");
  face_C3 = loadImage("img/face/face_C3.png");
  cha_Aleft = loadImage("img/characters/A/cha_Aleft.png");
  cha_Aleft2 = loadImage("img/characters/A/cha_Aleft2.png");
  cha_Aright = loadImage("img/characters/A/cha_Aright.png");
  cha_Aright2 = loadImage("img/characters/A/cha_Aright2.png");
  cha_Aback = loadImage("img/characters/A/cha_Aback.png");
  cha_Abackblack = loadImage("img/characters/A/cha_Abackblack.png");
  cha_Aworkup = loadImage("img/characters/A/cha_Aworkup.png");
  cha_Aworkup2 = loadImage("img/characters/A/cha_Aworkup2.png");
  cha_Aworkdown = loadImage("img/characters/A/cha_Aworkdown.png");
  cha_Aworkblack_up = loadImage("img/characters/A/cha_Aworkblack_up.png");
  cha_Aworkblack_down = loadImage("img/characters/A/cha_Aworkblack_down.png");
  cha_Bleft = loadImage("img/characters/B/cha_Bleft.png");
  cha_Bleft2 = loadImage("img/characters/B/cha_Bleft2.png");
  cha_Bright = loadImage("img/characters/B/cha_Bright.png");
  cha_Bright2 = loadImage("img/characters/B/cha_Bright2.png");
  cha_Bback = loadImage("img/characters/B/cha_Bback.png");
  cha_Bbackblack = loadImage("img/characters/B/cha_Bbackblack.png");
  cha_Bworkup = loadImage("img/characters/B/cha_Bworkup.png");
  cha_Bworkup2 = loadImage("img/characters/B/cha_Bworkup2.png");
  cha_Bworkdown = loadImage("img/characters/B/cha_Bworkdown.png");
  cha_Bworkblack_up = loadImage("img/characters/B/cha_Bworkblack_up.png");
  cha_Bworkblack_down = loadImage("img/characters/B/cha_Bworkblack_down.png");
  cha_Cleft = loadImage("img/characters/C/cha_Cleft.png");
  cha_Cleft2 = loadImage("img/characters/C/cha_Cleft2.png");
  cha_Cright = loadImage("img/characters/C/cha_Cright.png");
  cha_Cright2 = loadImage("img/characters/C/cha_Cright2.png");
  cha_Cback = loadImage("img/characters/C/cha_Cback.png");
  cha_Cbackblack = loadImage("img/characters/C/cha_Cbackblack.png");
  cha_Cworkup = loadImage("img/characters/C/cha_Cworkup.png");
  cha_Cworkup2 = loadImage("img/characters/C/cha_Cworkup2.png");
  cha_Cworkdown = loadImage("img/characters/C/cha_Cworkdown.png");
  cha_Cworkblack_up = loadImage("img/characters/C/cha_Cworkblack_up.png");
  cha_Cworkblack_down = loadImage("img/characters/C/cha_Cworkblack_down.png");
}

final int PLAYERX_INIT = 500;
final int PLAYERY_INIT = 195;
class Player {
  float x; //?????????????????????????????????
  float y; //?????????Y??????
  float yModify = 0; // ??????????????????
  float xOnScreen; // ???????????????????????????????????????
  String direction; //????????????????????????LEFT?????????RIGHT?????????BACK?????????
  String where; // ???????????????????????????HALL ?????????WORKING ????????????CUTTING ????????????GRINDING ????????????ADMIN ????????????
  String name; // ????????????
  int skin; // ???????????? (0:??????A 1:??????B 2:??????C)
  boolean moving = false;
  int movingTimer = 0;
  boolean moveable = true; //????????????????????????
  float speed;
  PImage currentImg;
  
  PImage left1,left2,right1,right2,back,backBlack;
  PImage face1,face2,face3;
  PImage pu1,pu2,pu3,pu4,pu5,pu_black;
  PImage[] rc;
  int CGI = -1;
  ArrayList<Item> bag = new ArrayList<Item>(1);
  

  Player(int skin,String name) {
    speed = 12;
    x = PLAYERX_INIT;
    y = PLAYERY_INIT;
    xOnScreen = width/2;
    direction = "LEFT";
    where = "START";
    this.name = name;
    this.skin = skin;
    switch(skin){
      case 0:
        left1 = cha_Aleft;
        left2 = cha_Aleft2;
        right1 = cha_Aright;
        right2 = cha_Aright2;
        back = cha_Aback;
        backBlack = cha_Abackblack;
        face1 = face_A1;
        face2 = face_A2;
        face3 = face_A3;
        pu1 = orangecat_pu_a;
        pu2 = orangecat_pu_a2;
        pu3 = orangecat_pu_a3;
        pu4 = orangecat_pu_a4;
        pu5 = orangecat_pu_a5;
        pu_black = orangecat_pu_a_black;
        yModify = 0;
        rc = rcA;
        break;
      case 1:
        left1 = cha_Bleft;
        left2 = cha_Bleft2;
        right1 = cha_Bright;
        right2 = cha_Bright2;
        back = cha_Bback;
        backBlack = cha_Bbackblack;
        face1 = face_B1;
        face2 = face_B2;
        face3 = face_B3;
        pu1 = orangecat_pu_b;
        pu2 = orangecat_pu_b2;
        pu3 = orangecat_pu_b3;
        pu4 = orangecat_pu_b4;
        pu5 = orangecat_pu_b5;
        pu_black = orangecat_pu_b_black;
        yModify = 0;
        rc = rcB;
        break;
      case 2:
        left1 = cha_Cleft;
        left2 = cha_Cleft2;
        right1 = cha_Cright;
        right2 = cha_Cright2;
        back = cha_Cback;
        backBlack = cha_Cbackblack;
        face1 = face_C1;
        face2 = face_C2;
        face3 = face_C3;
        pu1 = orangecat_pu_c;
        pu2 = orangecat_pu_c2;
        pu3 = orangecat_pu_c3;
        pu4 = orangecat_pu_c4;
        pu5 = orangecat_pu_c5;
        pu_black = orangecat_pu_c_black;
        yModify = -23;
        rc = rcC;
        break;
    }
  }
  
  // ---- ????????????????????????????????? ----
  //Player(float x,String where) {
  //  this.x = x;
  //  this.xOnScreen = width/2;
  //  this.direction = "LEFT";
  //  this.currentImg = chaALeft1;
  //  this.where = where;
  //}
  
  float xOffset = -63;
  float yOffset = 0;
  void display() {
    rectMode(CENTER);
    if(movingTimer%20<=10){
      if(direction == "LEFT"){
        currentImg = left1;
      }else if(direction == "RIGHT"){
        currentImg = right1;
      }
    }else{
      if(direction == "LEFT"){
        currentImg = left2;
      }else if(direction == "RIGHT"){
        currentImg = right2;
      }
    }
    if(direction == "BACK"){
      currentImg = back;
    }
    if(direction == "PU1"){
      currentImg = pu1;
    }
    if(direction == "PU2"){
      currentImg = pu2;
    }
    if(direction == "PU3"){
      currentImg = pu3;
    }
    if(direction == "PU4"){
      currentImg = pu4;
    }
    if(direction == "PU5"){
      currentImg = pu5;
    }
    if(direction == "PUBLACK"){
      currentImg = pu_black;
    }
    if(CGI!=-1){
      if(rc[CGI]!=null){
        currentImg = rc[CGI];
      }
      
    }
    image(currentImg,x+xOffset, y+yOffset+yModify);
  }
  
  void move() {
    final float MOVING_AREA = 50; // ???????????????????????????????????????
    final float SCENE_PADDING = 100; // ??????????????????????????????????????????
    if(moveable){
      if (keyPressed) {
        if (key == 'a' || key == 'A') {
          moving =true;
          x -= speed;// ????????????
          if (x<=SCENE_PADDING) { // ??????????????????????????????????????????
            x = SCENE_PADDING;
          }
          direction = "LEFT";// ??????????????????
          xOnScreen -= 14;// ????????????
          if (xOnScreen <= width/2 - MOVING_AREA/2) {
            xOnScreen = width/2 - MOVING_AREA/2;
          }
        }
        if (key == 'd' || key == 'D') {
          moving =true;
          x += speed;// ????????????
          if (x >= sceneWidth - SCENE_PADDING) { // ??????????????????????????????????????????
            x = sceneWidth - SCENE_PADDING;
          }
          direction = "RIGHT";// ??????????????????
          xOnScreen += 14;// ????????????
          if (xOnScreen >= width/2 + MOVING_AREA/2) {
            xOnScreen = width/2 + MOVING_AREA/2;
          }
        }
      }else{
        moving = false;
      }
    }
    if(moving){
      movingTimer++;
    }
  }
  
  void getItem(Item item){
    bag.add(item);
  }
  
  void removeItem(String name){
    for(int i=0;i<bag.size();i++){
      if(bag.get(i).name==name){
        bag.remove(i);
      }
    }
  }
  
  Boolean have(String item){
    for(int i=0;i<bag.size();i++){
      if(item == bag.get(i).name){
        return true;
      }
    }
    return false;
  }
}
