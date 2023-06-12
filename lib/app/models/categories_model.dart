class CategoriesModel {
  String idCategorie;
  String categoryDescription;

  CategoriesModel({
    required this.idCategorie,
    required this.categoryDescription,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      idCategorie: json['idCategorie'],
      categoryDescription: json['categoryDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idCategorie': idCategorie,
      'categoryDescription': categoryDescription,
    };
  }
}
