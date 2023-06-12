class CategoriesModel {
  String idCategoryTask;
  String categoryDescription;

  CategoriesModel({
    required this.idCategoryTask,
    required this.categoryDescription,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      idCategoryTask: json['idCategoryTask'],
      categoryDescription: json['categoryDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idCategoryTask': idCategoryTask,
      'categoryDescription': categoryDescription,
    };
  }
}
