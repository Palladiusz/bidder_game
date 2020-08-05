class Data {
  Data(this.isValidateInput, this.isWin, this.reward, this.userBid,
      this.userCoinsAmount, this.winChance);
  bool isValidateInput = false;
  int userCoinsAmount = 100;
  double winChance = 0.5;
  int userBid;
  double reward = 12;
  bool isWin;
}
