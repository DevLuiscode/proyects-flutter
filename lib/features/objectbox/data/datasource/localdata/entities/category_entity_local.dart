class CategoryEntityLocal {
  final int? id;
  final String name;

  CategoryEntityLocal({
    this.id,
    required this.name,
  });

  CategoryEntityLocal copyWith(
    int? id,
    String? name,
  ) {
    return CategoryEntityLocal(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory CategoryEntityLocal.fromMap(Map<String, dynamic> map) {
    return CategoryEntityLocal(
      id: map['id'],
      name: map['name'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
