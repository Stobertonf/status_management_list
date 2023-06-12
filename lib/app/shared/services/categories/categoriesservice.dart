import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:status_management_list/app/models/categories_model.dart';

class CategoriesService {
  Future<List<CategoriesModel>> fetchCategories() async {
    List<CategoriesModel> categories = [];

    await Parse().initialize(
      '12345678910SDFASDADS',
      'ASDADSDA12365478910SDFASD',
      autoSendSessionId: true,
      debug: true,
      coreStore: await CoreStoreSharedPrefsImp.getInstance(),
    );

    final queryBuilder = QueryBuilder<ParseObject>(
      ParseObject(
        'Category',
      ),
    );

    try {
      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        for (final categoriesObject in response.results!) {
          final category = CategoriesModel.fromJson(categoriesObject.toJson());
          categories.add(category);
        }
      }
    } catch (e) {
      print('Erro ao buscar as categorias: $e');
    }

    return categories;
  }

  Future<bool> saveCategory(CategoriesModel category) async {
    try {
      await Parse().initialize(
        '12345678910SDFASDADS',
        'ASDADSDA12365478910SDFASD',
        autoSendSessionId: true,
        debug: true,
        coreStore: await CoreStoreSharedPrefsImp.getInstance(),
      );

      final categoriesObject = ParseObject('Category')
        ..set('idCategoryTask', category.idCategoryTask)
        ..set('Description', category.categoryDescription);

      final response = await categoriesObject.save();

      return response.success;
    } catch (e) {
      print('Erro ao salvar a tarefa: $e');
      return false;
    }
  }
}
