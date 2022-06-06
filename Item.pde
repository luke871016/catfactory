PImage item_camera_small,item_camerabody_small,item_catcan_small,item_funnycatstick_small,item_goggles_small,item_key_small,
item_lens_black_small,item_lens_pu_small,item_note_small,item_ntustcard_small,item_paper_small,
item_papertape_small,item_pu_small,item_sandpaper_small,item_shovel_small,item_slenderpu_small,
item_spraypaintcan_small,item_toolbox_small,item_triangleboard_small,item_utilityknife_small,item_utilityknife2_small,item_verniercaliper_small,item_box_small;
PImage item_camera_big,item_camerabody_big,item_catcan_big,item_funnycatstick_big,item_goggles_big,item_key_big,
item_lens_black_big,item_lens_pu_big,item_note_big,item_ntustcard_big,item_paper_big,
item_papertape_big,item_pu_big,item_sandpaper_big,item_shovel_big,item_slenderpu_big,
item_spraypaintcan_big,item_toolbox_big,item_triangleboard_big,item_utilityknife_big,item_utilityknife2_big,item_verniercaliper_big,item_box_big,item_camera_big2;
void loadItemImg(){
  //load small img
  item_camera_small = loadImage("img/item/small/item_camera_small.png");
  item_camerabody_small = loadImage("img/item/small/item_camerabody_small.png");
  item_catcan_small = loadImage("img/item/small/item_catcan_small.png");
  item_funnycatstick_small = loadImage("img/item/small/item_funnycatstick_small.png");
  //item_goggles_small = loadImage("img/item/small/item_goggles_small.png");
  item_key_small = loadImage("img/item/small/item_key_small.png");
  item_lens_black_small = loadImage("img/item/small/item_lens_black_small.png");
  item_lens_pu_small = loadImage("img/item/small/item_lens_pu_small.png");
  item_note_small = loadImage("img/item/small/item_note_small.png");
  item_ntustcard_small = loadImage("img/item/small/item_ntustcard_small.png");
  item_paper_small = loadImage("img/item/small/item_paper_small.png");
  item_papertape_small = loadImage("img/item/small/item_papertape_small.png");
  item_pu_small = loadImage("img/item/small/item_pu_small.png");
  item_sandpaper_small = loadImage("img/item/small/item_sandpaper_small.png");
  item_shovel_small = loadImage("img/item/small/item_shovel_small.png");
  item_slenderpu_small = loadImage("img/item/small/item_slenderpu_small.png");
  item_spraypaintcan_small = loadImage("img/item/small/item_spraypaintcan_small.png");
  item_toolbox_small = loadImage("img/item/small/item_toolbox_small.png");
  item_triangleboard_small = loadImage("img/item/small/item_triangleboard_small.png");
  item_utilityknife_small = loadImage("img/item/small/item_utilityknife_small.png");
  item_utilityknife2_small = loadImage("img/item/small/item_utilityknife2_small.png");
  item_verniercaliper_small = loadImage("img/item/small/item_verniercaliper_small.png");
  item_box_small = loadImage("img/item/small/item_box_small.png");
  //load big img
  item_camera_big = loadImage("img/item/big/item_camera_big.png");
  item_camera_big2 = loadImage("img/item/big/item_camera_big2.png");
  item_camerabody_big = loadImage("img/item/big/item_camerabody_big.png");
  item_catcan_big = loadImage("img/item/big/item_catcan_big.png");
  item_funnycatstick_big = loadImage("img/item/big/item_funnycatstick_big.png");
  //item_goggles_big = loadImage("img/item/big/item_goggles_big.png");
  item_key_big = loadImage("img/item/big/item_key_big.png");
  item_lens_black_big = loadImage("img/item/big/item_lens_black_big.png");
  item_lens_pu_big = loadImage("img/item/big/item_lens_pu_big.png");
  item_note_big = loadImage("img/item/big/item_note_big.png");
  item_ntustcard_big = loadImage("img/item/big/item_ntustcard_big.png");
  item_paper_big = loadImage("img/item/big/item_paper_big.png");
  item_papertape_big = loadImage("img/item/big/item_papertape_big.png");
  item_pu_big = loadImage("img/item/big/item_pu_big.png");
  item_sandpaper_big = loadImage("img/item/big/item_sandpaper_big.png");
  item_shovel_big = loadImage("img/item/big/item_shovel_big.png");
  item_slenderpu_big = loadImage("img/item/big/item_slenderpu_big.png");
  item_spraypaintcan_big = loadImage("img/item/big/item_spraypaintcan_big.png");
  item_toolbox_big = loadImage("img/item/big/item_toolbox_big.png");
  item_triangleboard_big = loadImage("img/item/big/item_triangleboard_big.png");
  item_utilityknife_big = loadImage("img/item/big/item_utilityknife_big.png");
  item_utilityknife2_big = loadImage("img/item/big/item_utilityknife2_big.png");
  item_verniercaliper_big = loadImage("img/item/big/item_verniercaliper_big.png");
  item_box_big = loadImage("img/item/big/item_box_big.png");
}

class Item{
  PImage smallImg;
  PImage bigImg;
  String name;
  String infoShort;
  String[] info;
  // 帶有長敘述的物件
  Item(PImage smallImg,PImage bigImg,String name,String infoShort,String info){
    this.smallImg = smallImg;
    this.bigImg = bigImg;
    this.name = name;
    this.info = new String[1];
    this.info[0] = info;
    this.infoShort = infoShort;
  }
  // 帶有長敘述的物件
  Item(PImage smallImg,PImage bigImg,String name,String infoShort,String[] info){
    this.smallImg = smallImg;
    this.bigImg = bigImg;
    this.name = name;
    this.info = info;
    this.infoShort = infoShort;
  }
  // 沒有長敘述的物件
  Item(PImage smallImg,PImage bigImg,String name,String infoShort){
    this.smallImg = smallImg;
    this.bigImg = bigImg;
    this.name = name;
    this.info = new String[1];
    this.info[0] = infoShort;
    this.infoShort = infoShort;
  }
}
