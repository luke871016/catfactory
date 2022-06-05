//存檔與讀檔

void saveData(){
  JSONObject playerData;
  playerData = new JSONObject();
  playerData.setFloat("x",player.x);
  playerData.setString("where",player.where);
  saveJSONObject(playerData, "data/data.json");
}
void loadData(){
  JSONObject playerData = loadJSONObject("data/data.json");
  float x = playerData.getFloat("x");
  String where = playerData.getString("where");
  //player = new Player(x,where);
}
