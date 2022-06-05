//這頁處理所有的事件控制
//----事件變數宣告----
Event startingEvent;//開場劇情
Animation[] startingAni;
Event noteEvent;// 白板筆記劇情
Animation[] noteEventAni;

// 走廊物件
Event verniercaliper,triangleboard,pu,paper,papertape,toolbox,orangecat;
Event[] lockers;
Animation[] verniercaliperAni,triangleboardAni,puAni,paperAni,papertapeAni,toolboxAni,orangecatAni,orangecatAni2,orangecatAni3;

//助教室物件
Event catcan,upperLocker,lowerLocker;
Animation[] catcanAni,upperLockerAni,lowerLockerAni;

//手做室物件
Event box,shovel;
Animation[] shovelAni,boxAni0,boxAni1,boxAni2;


//切削室物件
Event bandSawA,bandSawB,bandSawC,goggles,sandpaper;
Animation[] bandSawAni,bandSawAni2,sandpaperAni;

//研磨室物件
Event lathe,funnycatstick,spraypaintcan,utilityknife2;
Animation[] latheAni,funnycatstickAni,spraypaintcanAni,utilityknife2Ani;

PImage piece;

//----事件初始化----
void initEvents(){
  // ----走廊物件----
  lockers = new Event[20];
  int i = 0;
  for(int y=0;y<2;y++){
    for(int x=0;x<10;x++){
      lockers[i] = new Event(door_locker,open_door_locker,open_door_locker_with_tool,"HALL",2805 + x*59,115 + y*106,37,92);
      i++;
    }
  }
  verniercaliper = new Event(scene_verniercaliper,"HALL",387,357,46,45);
  triangleboard = new Event(scene_triangleboard,"HALL",2803,267,46,45);
  pu = new Event(scene_pu,"HALL",2860,160,46,45);
  paper = new Event(scene_paper,"HALL",2977,154,46,45);
  papertape = new Event(scene_papertape,"HALL",3155,267,46,45);
  toolbox = new Event(scene_toolbox,"HALL",0,278,121,91);
  orangecat = new Event(orangecat_catchpu,"HALL",3112,285,91,91);
  
  //*********************pu事件*********************
  Item itemPu = new Item(item_pu_small,item_pu_big,"PU塊","便宜易加工的塑膠發泡材，設計系做模型的主流材料，在工廠很容易撿到");
  Item itemCamerabody = new Item(item_camerabody_small,item_camerabody_big,"相機機身","可以與PU鏡頭組合成完整的相機模型，模型課的經典作業");
  pu.stage = -1;
  puAni = new Animation[16];
  puAni[0] = new Dialogue("獲得物件","「PU塊」、「相機機身」");
  puAni[1] = new Dialogue(itemPu);
  puAni[2] = new Dialogue(itemCamerabody);
  puAni[3] = new Dialogue(player.face1,player.name,"這個櫃子有相機機身跟一塊PU欸");
  puAni[4] = new Dialogue(player.face1,player.name,"機身還已經做好塗裝完成了，手藝也比我平常交的作業好太多了...");
  puAni[5] = new Dialogue(player.face1,player.name,"把鏡頭做完組合好，就能夠進入助教室了吧？");
  puAni[6] = new Dialogue(player.face1,player.name,"先把PU拿去帶鋸機加工吧");
  puAni[7] = new Dialogue(player.face2,player.name,"誒... 這個聲音是？");
  puAni[8] = new Animation("PU_ANI",500,false);
  //puAni[8] = new Animation("WAIT",5,false);
  puAni[9] = new Animation("WAIT",15,false);
  puAni[10] = new Animation("BLACK_FADE_OUT",30,false);
  puAni[11] = new Dialogue("失去物件","「PU塊」");
  puAni[12] = new Animation("GET_ITEM",itemCamerabody);
  puAni[13] = new Dialogue(player.face3,player.name,"這是校貓小咪吧？為什麼小咪會在這裡？");
  puAni[14] = new Dialogue(player.face3,player.name,"而且他把我的PU搶走了...");
  puAni[15] = new Dialogue(player.face1,player.name,"得想點辦法吸引他的注意才行...");
  
  //*************跟小咪討回pu************
  
  orangecatAni = new Animation[3];
  orangecatAni[0] = new Dialogue(face_orangecat,"橘貓","喵～～～～～～～");
  orangecatAni[1] = new Dialogue(player.face2,player.name,"PU被小咪搶走了...");
  orangecatAni[2] = new Dialogue(player.face1,player.name,"得想點辦法吸引他的注意才行...");
  orangecat.stage = -1;
  
  orangecatAni2 = new Animation[8];
  orangecatAni2[0] = new Dialogue(player.face1,player.name,"這個逗貓棒可以跟你交換PU嗎？");
  orangecatAni2[1] = new Dialogue("失去物品","逗貓棒");
  orangecatAni2[2] = new Animation("LOSE_ITEM","逗貓棒");
  orangecatAni2[3] = new Dialogue(face_orangecat,"橘貓","喵～～～～～～～");
  orangecatAni2[4] = new Dialogue("獲得物品","PU塊");
  orangecatAni2[5] = new Animation("GET_ITEM",itemPu);
  orangecatAni2[6] = new Dialogue(itemPu);
  orangecatAni2[7] = new Dialogue("系統提示","橘貓對你的好感度上升了");
  
  orangecatAni3 = new Animation[1];
  orangecatAni3[0] = new Dialogue(face_orangecat,"橘貓","喵～～～～～～～");
  
  //偷用死全家紙條
  paperAni = new Animation[2];
  paperAni[0] = new Dialogue(player.face3,player.name,"紙條上面寫「偷拿工具或材料者，全家火葬場。」...");
  paperAni[1] = new Dialogue(player.face2,player.name,"這個置物櫃的主人也太兇狠了吧……");
  paper.stage = -1;

  //游標卡尺
  Item itemVerniercaliper = new Item(item_verniercaliper_small,item_verniercaliper_big,"游標卡尺","平常拿來測量的道具，聽說是可以解除某種封印的神器...","「隱藏著黑暗力量的鑰匙啊，在我面前顯示你真正的力量！\n現在以你的主人之名命令－封印解除！」\n據說可以解鎖助教室——沒，它只是一柄普通的游標卡尺。");
  verniercaliperAni = new Animation[3];
  verniercaliperAni[0] = new Dialogue("獲得道具","「"+itemVerniercaliper.name+"」");
  verniercaliperAni[1] = new Dialogue(itemVerniercaliper);
  verniercaliperAni[2] = new Animation("GET_ITEM",itemVerniercaliper); 
  
  //三角板
  Item itemTriangleboard = new Item(item_triangleboard_small,item_triangleboard_big,"三角板","置物櫃裡找到的三角板，看起來做完封扣方盒後就沒在使用了...");
  triangleboardAni = new Animation[3];
  triangleboardAni[0] = new Dialogue("獲得道具","「"+itemTriangleboard.name+"」");
  triangleboardAni[1] = new Dialogue(itemTriangleboard);
  triangleboardAni[2] = new Animation("GET_ITEM",itemTriangleboard); 
  triangleboard.stage = -1;
  //紙膠帶
  Item itemPapertape = new Item(item_papertape_small,item_papertape_big,"紙膠帶","放在櫃子裡就會輕易被別人A走的好東西");
  papertapeAni = new Animation[3];
  papertapeAni[0] = new Dialogue("獲得道具","「"+itemPapertape.name+"」");
  papertapeAni[1] = new Dialogue(itemPapertape);
  papertapeAni[2] = new Animation("GET_ITEM",itemPapertape); 
  papertape.stage = -1;
  
  // 工具箱
  Item itemToolbox = new Item(item_toolbox_small,item_toolbox_big,"工具箱","丟在角落的一只破舊工具箱，裡面放了一些基本的工具，至少夠用來做一些基礎的草模");
  toolboxAni = new Animation[3];
  toolboxAni[0] = new Dialogue("獲得道具","「"+itemToolbox.name+"」");
  toolboxAni[1] = new Dialogue(itemToolbox);
  toolboxAni[2] = new Animation("GET_ITEM",itemToolbox); 

  // ----助教室物件----
  catcan = new Event(scene_catcan,"ADMIN",407,187,46,46);
  upperLocker = new Event("ADMIN",110,145,277,92);
  lowerLocker = new Event("ADMIN",110,253,277,338);
  
  // ----研磨室物件----
  lathe = new Event(grinding_lathe,"GRINDING",600,160,458,197);
  funnycatstick = new Event(scene_funnycatstick,"GRINDING",89,331,46,45);
  spraypaintcan = new Event(scene_spraypaintcan,"GRINDING",164,247,46,45);
  utilityknife2 = new Event(scene_utilityknife2,"GRINDING",309,258,46,45);
  
  Item itemFunnycatstick = new Item(item_funnycatstick_small,item_funnycatstick_big,"逗貓棒","一根看起來很普通的逗貓棒，一端是綁著七彩羽毛的一隻老鼠布偶，但貓咪們為之瘋狂。");
  String[] fcs = {"工廠裡竟然有逗貓棒，真是太奇妙了"};
  funnycatstickAni = new Animation[4];
  funnycatstickAni[0] = new Dialogue("獲得道具","「"+itemFunnycatstick.name+"」");
  funnycatstickAni[1] = new Dialogue(itemFunnycatstick);
  funnycatstickAni[2] = new Animation("GET_ITEM",itemFunnycatstick); 
  funnycatstickAni[3] = new Dialogue(player.face2,player.name,fcs);
  
  Item itemSpraypaintcan = new Item(item_spraypaintcan_small,item_spraypaintcan_big,"噴漆罐","被隨意亂丟的噴漆罐，鐵樂士牌子的，有使用過的痕跡");
  spraypaintcanAni = new Animation[3];
  spraypaintcanAni[0] = new Dialogue("獲得道具","「"+itemSpraypaintcan.name+"」");
  spraypaintcanAni[1] = new Dialogue(itemSpraypaintcan);
  spraypaintcanAni[2] = new Animation("GET_ITEM",itemSpraypaintcan);
  
  Item itemUtilityknife2 = new Item(item_utilityknife2_small,item_utilityknife2_big,"美工刀","OLFA牌的美工刀，刀片有一點生鏽，換個刀刃應該很好用。");
  utilityknife2Ani = new Animation[3];
  utilityknife2Ani[0] = new Dialogue("獲得道具","「"+itemUtilityknife2.name+"」");
  utilityknife2Ani[1] = new Dialogue(itemUtilityknife2);
  utilityknife2Ani[2] = new Animation("GET_ITEM",itemUtilityknife2);
  
  // ----切削室物件----
  bandSawA = new Event(grinding_machine_a,"CUTTING",641,41,156,200);
  bandSawB = new Event(grinding_machine_b,"CUTTING",890,48,156,200);
  bandSawC = new Event(grinding_machine_b,"CUTTING",1110,48,156,200);
  goggles = new Event(scene_goggles,"CUTTING",1238,332,46,45);
  sandpaper = new Event(scene_sandpaper,"CUTTING",872,310,46,45);
  
  bandSawAni = new Animation[1];
  bandSawAni[0] = new Dialogue(player.face1,player.name,"帶鋸機有電源呢，不過我現在好像沒什麼東西好加工的");
  
  bandSawAni2 = new Animation[1];
  bandSawAni2[0] = new Dialogue(player.face1,player.name,"終於拿到PU了，把PU切成容易車床加工的形狀吧！");
  
  // ** 湘芸沒有畫物件的護目鏡QQ
  
  //砂紙
  Item itemSandpaper = new Item(item_sandpaper_small,item_sandpaper_big,"砂紙","爛爛的龍蝦牌200號砂紙，");
  sandpaperAni = new Animation[3];
  sandpaperAni[0] = new Dialogue("獲得道具","「"+itemSandpaper.name+"」");
  sandpaperAni[1] = new Dialogue(itemSandpaper);
  sandpaperAni[2] = new Animation("GET_ITEM",itemSandpaper); 
  
  // ----手做室物件----
  box = new Event(scene_unfoldedBox,"WORKING",455,221,196,91);
  shovel = new Event(scene_shovel,"WORKING",1111,306,126,51);
  
  Item itemShovel = new Item(item_shovel_small,item_shovel_big,"鐵撬","一柄老舊生鏽的鐵撬。其中一端已經凹了。");
  String[] sho = {"這個鐵橇好像可以拿來開門"};
  shovelAni = new Animation[4];
  shovelAni[0] = new Dialogue(player.face1,player.name,sho);
  shovelAni[1] = new Dialogue("獲得道具","「鐵橇」");
  shovelAni[2] = new Dialogue(itemShovel);
  shovelAni[3] = new Animation("GET_ITEM",itemShovel); 
  
  // ***製作封扣方盒事件***
  Item boxItem = new Item(item_box_small,item_box_big,"封扣方盒","模型課的經典作業，上面寫有疑似助教室電子鎖密碼，這次黏貼邊這麼完美，應該有第一堆的成績吧。\n（然後助教會把那個數字圈起來當作髒污... 壞助教...）");
  boxAni0 = new Animation[5];
  boxAni0[0] = new Dialogue(player.face1,player.name,"桌上有做到一半的封扣方盒欸");
  boxAni0[1] = new Dialogue(player.face1,player.name,"看起來都切好了只差要黏貼起來而已，旁邊擺這罐白膠就是這個意思嗎？");
  boxAni0[2] = new Dialogue(player.face2,player.name,"這個半成品也切得太好了吧...");
  boxAni0[3] = new Dialogue(player.face2,player.name,"黏起來會直接過的那種欸！");
  boxAni0[4] = new Dialogue(player.face2,player.name,"不過還缺少直角規、游標卡尺之類的工具，黏歪了可就糟了");
  
  boxAni1 = new Animation[1];
  boxAni1[0] = new Dialogue(player.face2,player.name,"還缺少直角規、游標卡尺之類的工具，黏歪了可就糟了");
  
  boxAni2 = new Animation[10];
  boxAni2[0] = new Dialogue(player.face2,player.name,"剛剛有撿到游標卡尺，工具箱裡面也有其他需要的東西了，可以開始動工了！");
  boxAni2[1] = new Animation("BLACK_FADE_IN",15,false);
  boxAni2[2] = new Animation("PLAYER_MOVE","WORKING",556);
  boxAni2[3] = new Animation("BOX_MAKING",240,true);
  boxAni2[4] = new Animation("BLACK_FADE_OUT",1,false);
  boxAni2[5] = new Dialogue("獲得道具","「封扣方盒」");
  boxAni2[6] = new Dialogue(boxItem);
  boxAni2[7] = new Animation("GET_ITEM",boxItem); 
  boxAni2[8] = new Dialogue(player.face2,player.name,"感覺這個模型比我以前做的都還好...");
  boxAni2[9] = new Dialogue(player.face2,player.name,"這個盒子上面的數字...就是助教室密碼嗎？");
  
  // ----開場劇情----
  startingEvent = new Event();
  startingAni = new Animation[9];
  String[] ses1 = {"已經連續三周模型都在第四堆了......這樣下去我會不會被當掉？","春節連假五天，還是乖乖在工廠裡練習做模型吧！"};
  String[] ses2 = {"......","咦，學校又跳電了嗎？","真奇怪"};
  String[] ses3 = {"電終於回來了","......","奇怪，我剛剛不是在手作室裡面嗎？","工廠變得好奇怪......","總之先四處看看吧。"};
  startingAni[0] = new Animation("WAITING",15,false);
  startingAni[1] = new Dialogue(player.face1,player.name,ses1);
  startingAni[2] = new Animation("BLACK_FADE_IN",5,false);
  startingAni[3] = new Animation("WAITING",30,false);
  startingAni[4] = new Animation("PLAYER_MOVE","HALL",1104);
  startingAni[5] = new Dialogue(player.face2,player.name,ses2);
  startingAni[6] = new Animation("BLACK_FADE_OUT",90,false);
  startingAni[7] = new Animation("WAITING",30,false);
  startingAni[8] = new Dialogue(player.face1,player.name,ses3);
  
  // ----紙條劇情----（取得紙條、手作室鑰匙）
  noteEvent = new Event(scene_note,"HALL",1141,149,77,51);
  noteEventAni = new Animation[13];
  String[] wbs0_1 = {"白板上面有助教的值班時間。","但工廠變的這麼奇怪，一個人都沒有...","更不用說是助教了...","上面似乎有張匆忙留下的紙條","看看都寫些什麼好了..."};
  String[] noteInfo = {"看到紙條的你，先不要慌張。\n你已經不在原本的工廠了，這裡不是你所熟知的世界！\n如果不想辦法離開，會永遠被困在這裡！"+
                   "\n我盡量留下能讓你離開的線索了，趁「那個東西」發現之前......\n遵守下面的規則行動就能順利逃出去，祝你好運！",
                   "1. 助教室裡有能夠幫助你離開的物品。\n電子鎖的密碼我分散在模型裡藏起來了，趕快找出來。\n2. 紙條背後的鑰匙可以打開手作室。\n3. 工廠裡不會有貓，但如果遇到橘色的貓要取得牠的好感。"+
                   "\n4. 貓是一種體態優雅靈巧、只有一條尾巴的生物；\n貓不會發出笑聲或說話，不管發生任何事都不要餵食牠們。\n5. 助教室是安全的，除非你動了不該動的東西。"};
  String[] wbs0_2 = {"嘖......","這些內容是... 這裡的規則？"};
  String[] wbs0_3 = {"總之是要回到手做室做模型嗎...","然後就可以進到助教室？然後逃出這裡？？","先把紙條帶著，然後到處看看吧"};
  Item itemKey= new Item(item_key_small,item_key_big,"手作室鑰匙","一把普通的銀色鑰匙，根據紙條留下的線索，似乎可以打開手做室的門。");
  Item itemNote = new Item(item_note_small,item_note_big,"紙條","一張不知道是誰留下的紙條，上面寫著許多提示與指引",noteInfo);
  
  noteEventAni[0] = new Dialogue(player.face1,player.name,wbs0_1);
  noteEventAni[1] = new Dialogue("獲得道具","「紙條」");
  noteEventAni[2] = new Dialogue(itemNote);
  noteEventAni[3] = new Dialogue(player.face1,player.name,wbs0_2);
  noteEventAni[4] = new Dialogue(player.face3,player.name,"這裡不是工廠，我來到異世界了？！");
  noteEventAni[5] = new Dialogue(player.face2,player.name,"結果還不是一樣要叫我做模型... 傻眼...");
  noteEventAni[6] = new Dialogue(player.face1,player.name,"紙條背後好像還有東西");
  noteEventAni[7] = new Dialogue("獲得道具","「手做室鑰匙」");
  noteEventAni[8] = new Dialogue(itemKey);
  noteEventAni[9] = new Dialogue(player.face1,player.name,wbs0_3);
  noteEventAni[10] = new Animation("GET_ITEM",itemNote);
  noteEventAni[11] = new Animation("GET_ITEM",itemKey);
  noteEventAni[12] = new Dialogue("系統提示","點擊 B 可以打開包包檢視身上的物件");
}

// 事件更新
void eventsUpdate(){
  // *********PU帶鋸加工*********
  if((bandSawA.clicked()||bandSawB.clicked()||bandSawC.clicked()) && !bandSawA.playing){
    bandSawA.playing = true;
    animationsReset(bandSawAni);
    if(player.have("PU塊") && bandSawA.stage == 0){
      bandSawA.stage = 1;
    }else{
      bandSawA.stage = 0;
    }
  }
  if(bandSawA.playing){
    if(bandSawA.stage == 0){
      animationsUpdate(bandSawAni);
      if(animationsDone(bandSawAni)){
        bandSawA.playing = false;
      }
    }else if(bandSawA.stage == 1){
      animationsUpdate(bandSawAni2);
      if(animationsDone(bandSawAni2)){
        bandSawA.playing = false;
      }
    }
  
  }
  
  // *********小咪搶pu********
  if(pu.clicked() && pu.playing == false && pu.stage!=-1){
    pu.playing = true;
  }
  if(pu.playing && pu.stage!=-1){
    animationsUpdate(puAni);
  }
  
  if(orangecat.clicked() && orangecat.playing == false && orangecat.stage!=-1){
    if(player.have("逗貓棒")&&orangecat.stage==0){
      orangecat.stage = 1;
    }
    if(orangecat.img == orangecatSit && orangecat.stage==1){
      orangecat.stage=2;
    }
    animationsReset(orangecatAni);
    animationsReset(orangecatAni3);
    orangecat.playing = true;
  }
  if(orangecat.playing){
    if(orangecat.stage == 0){
      animationsUpdate(orangecatAni);
      if(animationsDone(orangecatAni)){
        orangecat.playing = false;
      }
    }
    if(orangecat.stage == 1){
      animationsUpdate(orangecatAni2);
      if(animationsDone(orangecatAni2)){
        orangecat.img = orangecatSit;
        orangecat.playing = false;
      }
    }
    if(orangecat.stage == 2){
      animationsUpdate(orangecatAni3);
      if(animationsDone(orangecatAni3)){
        orangecat.playing = false;
      }
    }
  }
  println(player.moveable);
  // ***做封扣方盒***
  if(box.clicked() && box.playing == false && box.stage!=-1){
    if(player.have("工具箱") && player.have("游標卡尺")){
      box.stage = 2;
    }
    animationsReset(boxAni1);
    box.playing = true;
  }
  if(box.playing && box.stage!=-1){
    switch(box.stage){
      case 0:
        animationsUpdate(boxAni0);
        if(animationsDone(boxAni0)){
          box.stage = 1;
          box.playing = false;
        }
        break;
      case 1:
        animationsUpdate(boxAni1);
        if(animationsDone(boxAni1)){
          box.playing = false;
        }
        break;
      case 2:
        animationsUpdate(boxAni2);
        if(animationsDone(boxAni2)){
          box.stage = -1;
          box.playing = false;
        }
        break;
        
    }
  }
  
  // 打開置物櫃
  for(int i=0;i<20;i++){
    if(lockers[i].stage == 0 && lockers[i].clicked()){
      if(i==1||i==3||i==10||i==16){
        lockers[i].stage = -1;
        switch(i){
          case 1:
            pu.stage = 0;
            break;
          case 3:
            paper.stage = 0;
            break;
          case 10:
            triangleboard.stage = 0;
            break;
          case 16:
            papertape.stage = 0;
            break;
        }
      }else{
        lockers[i].stage = 1;
      }
    }
  }
  //一次性的事件
  eventsOnce(shovel,shovelAni);
  eventsOnce(noteEvent,noteEventAni);
  eventsOnce(verniercaliper,verniercaliperAni);
  eventsOnce(triangleboard,triangleboardAni);
  eventsOnce(papertape,papertapeAni);
  eventsOnce(sandpaper,sandpaperAni);
  eventsOnce(funnycatstick,funnycatstickAni);
  eventsOnce(spraypaintcan,spraypaintcanAni);
  eventsOnce(utilityknife2,utilityknife2Ani);
  eventsOnce(toolbox,toolboxAni);
  
  //可以重複觸發的對話跟事件
  eventsRepeat(paper,paperAni);
  
  //開場劇情更新
  //if(startingEvent.stage!=-1){
  //  player.moveable = false;
  //  animationsUpdate(startingAni);
  //  Boolean end = true;
  //  for(int i=0;i<startingAni.length;i++){
  //    if(!startingAni[i].closed){
  //      end = false;
  //      break;
  //    }
  //  }
  //  if(end){
  //    player.moveable = true;
  //    startingEvent.stage = -1;
  //  }
  //}
}

// 可以重複觸發的對話跟事件
void eventsRepeat(Event event,Animation[] ani){
  if(event.stage!=-1 && event.clicked() && !event.playing){
    animationsReset(ani);
    event.playing = true;
  }
  if(paper.playing){
    animationsUpdate(ani);
  }
  
  if(animationsDone(ani)){
    event.playing = false;
  }
}

// 一次性事件模板
void eventsOnce(Event event,Animation[] ani){
  if(event.stage!=-1){
    if(event.clicked()){
      event.playing = true;
    }
    if(event.playing){
      Boolean end = true;
      if(event.stage == 0){
        animationsUpdate(ani);
        for(int i=0;i<ani.length;i++){
          if(!ani[i].closed){
            end = false;
            break;
          }
        }
        if(end){
          event.stage = -1;
          event.playing = false;
        }
      }
    }
  }
}

// 對話文字顯示（圖層在最頂層，目前只有文字顯示會放在這）

void textDisplay(){
  eventTextDisplay(triangleboard,triangleboardAni);
  eventTextDisplay(verniercaliper,verniercaliperAni);
  eventTextDisplay(shovel,shovelAni);
  eventTextDisplay(noteEvent,noteEventAni);
  eventTextDisplay(papertape,papertapeAni);
  eventTextDisplay(sandpaper,sandpaperAni);
  eventTextDisplay(funnycatstick,funnycatstickAni);
  eventTextDisplay(spraypaintcan,spraypaintcanAni);
  eventTextDisplay(utilityknife2,utilityknife2Ani);
  eventTextDisplay(paper,paperAni);
  eventTextDisplay(toolbox,toolboxAni);
  
  //eventTextDisplay(box,boxAni2);
  
  eventTextDisplay(pu,puAni);
  //****PU帶鋸機加工****
  if(bandSawA.stage==0){
    eventTextDisplay(bandSawA,bandSawAni);
  }else if(bandSawA.stage==1){
    eventTextDisplay(bandSawA,bandSawAni2);
  }
  
  //****小咪搶PU******
  if(orangecat.stage == 0){
    eventTextDisplay(orangecat,orangecatAni);
  }else if(orangecat.stage == 1){
    eventTextDisplay(orangecat,orangecatAni2);
  }else if(orangecat.stage == 2){
    eventTextDisplay(orangecat,orangecatAni3);
  }
  
  switch(box.stage){
    case 0:
      eventTextDisplay(box,boxAni0);
      break;
    case 1:
      eventTextDisplay(box,boxAni1);
      break;
    case 2:
      eventTextDisplay(box,boxAni2);
      break;
  }

  // 開場劇情文字
  if(startingEvent.stage!=-1){
    animationsDisplay(startingAni);
  }
}

void eventTextDisplay(Event event,Animation[] ani){
  if(event.playing){
    animationsDisplay(ani);
  }
}
