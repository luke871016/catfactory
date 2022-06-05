// 這頁放各種需要計時的東西
int enterDoorCD = 0;// 進門冷卻時間
int bagOpenCD = 0;// 開背包冷卻時間
int bagGuiCD = 0;// 背包切換物件冷卻時間
int clickCD = 0; // 點擊事件觸發冷卻

void countDown() {
  enterDoorCD = (enterDoorCD>0)?enterDoorCD-1:0;
  bagOpenCD = (bagOpenCD>0)?bagOpenCD-1:0;
  bagGuiCD = (bagGuiCD>0)?bagGuiCD-1:0;
  clickCD = (clickCD>0)?clickCD-1:0;
}
