class CategoryModel {
  final int? id;
  final String name;

  CategoryModel({this.id, required this.name});

  CategoryModel copyWith(
    int? id,
    String? name,
  ) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}
