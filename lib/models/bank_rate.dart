class BankRate {
  final String id;
  final num buy;
  final num sell;
  final String name;

  BankRate({
    this.id,
    this.name,
    this.buy,
    this.sell,
  });

  factory BankRate.fromJson(Map<String, dynamic> json) {
    return BankRate(
      id: json['id'],
      name: json['name'],
      buy: json['buy'],
      sell: json['sell'],
    );
  }
}
