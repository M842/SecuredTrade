class Strategy {
  late String symbol,
      currencyType,
      name,
      price,
      percentage,
      position,
      floatingPL,
      avgPrice,
      quantity;

  Strategy({
    required this.symbol,
    required this.currencyType,
    required this.name,
    required this.price,
    required this.percentage,
    required this.position,
    required this.floatingPL,
    required this.avgPrice,
    required this.quantity,
  });
}
