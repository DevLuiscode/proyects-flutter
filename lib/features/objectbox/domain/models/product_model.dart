class ProductModel {
  final String name;
  final String description;
  final double priceHigher;
  final double pridceUnit;
  final String image;

  ProductModel({
    required this.name,
    required this.description,
    required this.priceHigher,
    required this.pridceUnit,
    required this.image,
  });

  ProductModel copyWith(
    String? name,
    String? description,
    double? priceHigher,
    double? pridceUnit,
    String? image,
  ) =>
      ProductModel(
        name: name ?? this.name,
        description: description ?? this.description,
        priceHigher: priceHigher ?? this.priceHigher,
        pridceUnit: pridceUnit ?? this.pridceUnit,
        image: image ?? this.image,
      );
}
