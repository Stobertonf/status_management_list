class CategoriesModel {
  String idCategorieTask;
  String categoryDescription;

  CategoriesModel({
    required this.idCategorieTask,
    required this.categoryDescription,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      idCategorieTask: json['idCategorieTask'],
      categoryDescription: json['categoryDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idCategorie': idCategorieTask,
      'categoryDescription': categoryDescription,
    };
  }
}
