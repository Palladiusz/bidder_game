import 'dart:math';

class BidderService {
  double fee = 0.02;

  calculateReward(int bidAmount, double winChance) =>
      (bidAmount / winChance) * (1 - fee);

  bool play(double winChance) {
    Random random = new Random();
    var randomNum = random.nextDouble();

    if (randomNum >= winChance) {
      return false;
    } else {
      return true;
    }
  }
}
