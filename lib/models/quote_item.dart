class QuoteItem {
  String name;
  int quantity;
  double rate;
  double discount;
  double taxPercent;

  QuoteItem({
    this.name = "",
    this.quantity = 1,
    this.rate = 0.0,
    this.discount = 0.0,
    this.taxPercent = 0.0,
  });

  double get total {
    final discountedRate = rate - discount;
    final baseAmount = discountedRate * quantity;
    final taxAmount = baseAmount * (taxPercent / 100);
    return baseAmount + taxAmount;
  }
}
