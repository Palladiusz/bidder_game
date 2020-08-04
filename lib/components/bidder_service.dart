class BidderService {
  double fee = 0.02;

  calculateReward(int bidAmount, int winChance) =>
      (bidAmount / winChance) * (1 - fee);
}

// bidAmount / winChance * (100% - fee), gdzie

// bidAmount: ilość postawionych żetonów,
// winChance: szansa wygranej wyrażona w przedziale <0, 1>,
// fee: stała wartość 2% - opłata dla aplikacji.
