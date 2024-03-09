class CardModel {
  final int? amount;
  final double? priceTotal;
  final String name;
  final double priceHigher;
  final double pridceUnit;
  final String image;

  CardModel({
    this.amount = 0,
    this.priceTotal = 0,
    required this.name,
    required this.priceHigher,
    required this.pridceUnit,
    required this.image,
  });

  CardModel copyWith({
    int? amount,
    double? priceTotal,
    String? name,
    double? priceHigher,
    double? pridceUnit,
    String? image,
  }) =>
      CardModel(
        amount: amount ?? this.amount,
        priceTotal: priceTotal ?? this.priceTotal,
        name: name ?? this.name,
        priceHigher: priceHigher ?? this.priceHigher,
        pridceUnit: pridceUnit ?? this.pridceUnit,
        image: image ?? this.image,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModel &&
          runtimeType == other.runtimeType &&
          name == other.name;

  // Añade comparaciones para otros campos aquí, si los hay

  @override
  int get hashCode => name.hashCode;
  // Añade los hashCode de otros campos aquí, si los hay, por ejemplo:
  // int get hashCode => hashValues(name, otroCampo);
}
