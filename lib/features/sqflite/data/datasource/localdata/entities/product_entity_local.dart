class ProductEntityLocal {
  final int id;
  final String name;
  final String description;
  final double priceHigher;
  final double priceUnit;
  final String image;
  final int idCategory;

  ProductEntityLocal({
    this.id = -1,
    required this.name,
    required this.description,
    required this.priceHigher,
    required this.priceUnit,
    required this.image,
    required this.idCategory,
  });

  ProductEntityLocal copyWith(
    int? id,
    String? name,
    String? description,
    double? priceHigher,
    double? priceUnit,
    String? image,
    int? idCategory,
  ) {
    return ProductEntityLocal(
      name: name ?? this.name,
      description: description ?? this.description,
      priceHigher: priceHigher ?? this.priceHigher,
      priceUnit: priceUnit ?? this.priceUnit,
      image: image ?? this.image,
      idCategory: idCategory ?? this.idCategory,
    );
  }

  factory ProductEntityLocal.fromMap(Map<String, dynamic> map) {
    return ProductEntityLocal(
        name: map['name'],
        description: map['description'],
        priceHigher: map['priceHigher'],
        priceUnit: map['priceUnit'],
        image: map['image'],
        idCategory: map['category_id']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'priceHigher': priceHigher,
      'priceUnit': priceUnit,
      'image': image,
      'category_id': idCategory,
    };
  }
}
