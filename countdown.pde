// 這頁放各種需要計時的東西
int enterDoorCD = 0;// 進門冷卻時間

void countDown() {
  
  enterDoorCD--;
  if (enterDoorCD<=0) {
    enterDoorCD=0;
  }
}
