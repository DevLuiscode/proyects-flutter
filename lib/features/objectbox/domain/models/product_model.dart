class ProductModel {
  final String name;
  final String description;
  final double priceHigher;
  final double pridceUnit;
  final String? image;
  final int? idCategory;

  ProductModel({
    required this.name,
    required this.description,
    required this.priceHigher,
    required this.pridceUnit,
    this.image,
    this.idCategory,
  });

  ProductModel copyWith(
    String? name,
    String? description,
    double? priceHigher,
    double? pridceUnit,
    String? image,
    int? idCategory,
  ) =>
      ProductModel(
        name: name ?? this.name,
        description: description ?? this.description,
        priceHigher: priceHigher ?? this.priceHigher,
        pridceUnit: pridceUnit ?? this.pridceUnit,
        image: image ?? this.image,
        idCategory: idCategory ?? this.idCategory,
      );
}
