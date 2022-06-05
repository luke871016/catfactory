// 場景圖片
PImage player_bg;
PImage hall_bg;
PImage admin_bg;
PImage working_bg;
PImage cutting_bg;
PImage grinding_bg;
PImage homepage_bg;

// 場景部件
PImage admin_table,door_a_inside,door_b_inside,door_a,door_b,door_locker,elevator_open;
PImage grinding_lathe,grinding_machine_a,grinding_machine_b,open_door_a_inside,open_door_a,open_door_b,open_door_b_inside;
PImage open_door_locker_with_tool,open_door_locker;
PImage player_table,working_table;

// 場景物件
PImage scene_catcan,scene_funnycatstick,scene_goggles,scene_note,scene_note2,scene_note3,
scene_paper,scene_papertape,scene_pu,scene_sandpaper,scene_shovel,scene_spraypaintcan,scene_toolbox,
scene_triangleboard,scene_unfoldedBox,scene_utilityknife,scene_utilityknife2,scene_verniercaliper;

// CG圖片
PImage cgmask;
PImage cube_hand;
PImage[] cube_making;
PImage[] orangecat_pu;
PImage orangecatLeft1,orangecatLeft2,orangecatSit,orangecat_catchpu;

// 載入圖片
void loadSceneImg(){
  //CG圖片
  cube_hand = loadImage("img/CG/cube/cube_hand.png");
  cube_making = new PImage[5];
  cube_making[0] = loadImage("img/CG/cube/cube_making1.png");
  cube_making[1] = loadImage("img/CG/cube/cube_making2.png");
  cube_making[2] = loadImage("img/CG/cube/cube_making3.png");
  cube_making[3] = loadImage("img/CG/cube/cube_making4.png");
  cube_making[4] = loadImage("img/CG/cube/cube_making5.png");
  cgmask = loadImage("img/CG/mask.png");
  
  orangecat_catchpu = loadImage("img/characters/orangecat/orangecat_catchpu.png");
  orangecatSit = loadImage("img/characters/orangecat/orangecat_sit.png");
  orangecatLeft1 = loadImage("img/characters/orangecat/orangecat_left.png");
  orangecatLeft2 = loadImage("img/characters/orangecat/orangecat_left2.png");
  orangecat_pu = new PImage[3];
  orangecat_pu[0] = loadImage("img/CG/orangecat/orangecat_meow.png");
  orangecat_pu[1] = loadImage("img/CG/orangecat/orangecat_meow2.png");
  orangecat_pu[2] = loadImage("img/CG/orangecat/orangecat_meow3.png");
  // 背景
  player_bg = loadImage("img/scene/background/player_bg.png");
  hall_bg = loadImage("img/scene/background/hall_bg.png");
  admin_bg = loadImage("img/scene/background/admin_bg.png");
  working_bg = loadImage("img/scene/background/working_bg.png");
  cutting_bg = loadImage("img/scene/background/cutting_bg.png");
  grinding_bg = loadImage("img/scene/background/grinding_bg.png");
  homepage_bg = loadImage("img/scene/background/homepage_bg.png");
  admin_table = loadImage("img/scene/part/admin_table.png");
  // 部件
  door_a_inside = loadImage("img/scene/part/door_a_inside.png");
  door_a = loadImage("img/scene/part/door_a.png");
  door_b_inside = loadImage("img/scene/part/door_b_inside.png");
  door_b = loadImage("img/scene/part/door_b.png");
  door_locker = loadImage("img/scene/part/door_locker.png");
  elevator_open = loadImage("img/scene/part/elevator_open.png");
  grinding_lathe = loadImage("img/scene/part/grinding_lathe.png");
  grinding_machine_a = loadImage("img/scene/part/grinding_machine_a.png");
  grinding_machine_b = loadImage("img/scene/part/grinding_machine_b.png");
  open_door_a_inside = loadImage("img/scene/part/open_door_a_inside.png");
  open_door_a = loadImage("img/scene/part/open_door_a.png");
  open_door_b = loadImage("img/scene/part/open_door_b.png");
  open_door_b_inside = loadImage("img/scene/part/open_door_b_inside.png");
  open_door_locker_with_tool = loadImage("img/scene/part/open_door_locker_with_tool.png");
  open_door_locker = loadImage("img/scene/part/open_door_locker.png");
  player_table = loadImage("img/scene/part/player_table.png");
  working_table = loadImage("img/scene/part/working_table.png");
  // 場景物件
  scene_catcan = loadImage("img/sceneObject/scene_catcan.png");
  scene_funnycatstick = loadImage("img/sceneObject/scene_funnycatstick.png");
  scene_goggles = loadImage("img/sceneObject/scene_goggles.png");
  scene_note = loadImage("img/sceneObject/scene_note.png");
  scene_note2 = loadImage("img/sceneObject/scene_note2.png");
  scene_note3 = loadImage("img/sceneObject/scene_note3.png");
  scene_paper = loadImage("img/sceneObject/scene_paper.png");
  scene_papertape = loadImage("img/sceneObject/scene_papertape.png");
  scene_pu = loadImage("img/sceneObject/scene_pu.png");
  scene_sandpaper = loadImage("img/sceneObject/scene_sandpaper.png");
  scene_shovel = loadImage("img/sceneObject/scene_shovel.png");
  scene_spraypaintcan = loadImage("img/sceneObject/scene_spraypaintcan.png");
  scene_toolbox = loadImage("img/sceneObject/scene_toolbox.png");
  scene_triangleboard = loadImage("img/sceneObject/scene_triangleboard.png");
  scene_unfoldedBox = loadImage("img/sceneObject/scene_unfoldedBox.png");
  scene_utilityknife = loadImage("img/sceneObject/scene_utilityknife.png");
  scene_utilityknife2 = loadImage("img/sceneObject/scene_utilityknife2.png");
  scene_verniercaliper = loadImage("img/sceneObject/scene_verniercaliper.png");
  
}


// 場景的寬度數字
float sceneWidth;//儲存目前的場景寬度（用於控制鏡頭移動以及限制角色移動範圍）
final float HALL_WIDTH = 3748;
final float WORKING_WIDTH = 1330;
final float CUTTING_WIDTH = 1330;
final float GRINDING_WIDTH = 1330;
final float ADMIN_WIDTH = 1330;

void sceneLayer0(){
  noStroke();
  switch(player.where){
    case "HALL":
      sceneWidth = HALL_WIDTH;
      image(hall_bg,0,0,sceneWidth,420);
      break;
    case "WORKING":
      sceneWidth = WORKING_WIDTH;
      image(working_bg,0,0,sceneWidth,420);
      break;
    case "CUTTING":
      sceneWidth = CUTTING_WIDTH;
      image(cutting_bg,0,0,sceneWidth,420);
      break;
    case "GRINDING":
      sceneWidth = GRINDING_WIDTH;
      image(grinding_bg,0,0,sceneWidth,420);
      break;
    case "ADMIN":
      sceneWidth = ADMIN_WIDTH;
      image(admin_bg,0,0,sceneWidth,420);
      break;
  }
}

void sceneLayer1(){
  // 門
  workingDoor.display();
  adminDoor.display();
  cuttingDoor.display();
  grindingDoor.display();
  switch(player.where){
    case "HALL":
      tint(220);
      for(int i=0;i<20;i++){
        lockers[i].display();
      }
      noTint();
      orangecat.display();
      verniercaliper.display();
      triangleboard.display();
      pu.display();
      paper.display();
      papertape.display();
      noteEvent.display();
      toolbox.display();
      break;
    case "WORKING":
      shovel.display();
      break;
    case "CUTTING":
      goggles.display();
      sandpaper.display();
      bandSawA.display();
      bandSawB.display();
      bandSawC.display();
      break;
    case "GRINDING":
      lathe.display();
      funnycatstick.display();
      break;
    case "ADMIN":
      catcan.display();
      image(admin_table,534,254);
      image(admin_table,809,254);
      break;
  }
}


void sceneLayer2(){
  // 道具
  box.display();
  
  // 前景部件
  switch(player.where){
    case "HALL":
      
      break;
    case "WORKING":
      image(working_table,402,281);
      image(working_table,843,281);
      break;
    case "CUTTING":

      break;
    case "GRINDING":
      image(working_table,115,282);
      spraypaintcan.display();
      utilityknife2.display();
      break;
    case "ADMIN":
      
      break;
  }
}
