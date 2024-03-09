class ProductEntity {
  final String name;
  final String description;
  final double priceHigher;
  final double priceUnit;
  final String image;

  ProductEntity({
    required this.name,
    required this.description,
    required this.priceHigher,
    required this.priceUnit,
    required this.image,
  });

  ProductEntity copyWith(
    String? name,
    String? description,
    double? priceHigher,
    double? priceUnit,
    String? image,
  ) =>
      ProductEntity(
        name: name ?? this.name,
        description: description ?? this.description,
        priceHigher: priceHigher ?? this.priceHigher,
        priceUnit: priceUnit ?? this.priceUnit,
        image: image ?? this.image,
      );
}
