import 'package:get/get.dart';
import 'package:status_management_list/app/models/categories_model.dart';
import 'package:status_management_list/app/shared/services/categories/categoriesservice.dart';

class CategoriesController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CategoriesModel> tasks = <CategoriesModel>[].obs;
  final CategoriesService _categorieService = CategoriesService();

  void fetchCategories() async {
    try {
      isLoading.value = true;
      final response = await _categorieService.fetchCategories();
      tasks.assignAll(response);
    } catch (e) {
      Get.snackbar(
          'Erro', 'Ocorreu um erro ao buscar as Categorias das tarefas');
    } finally {
      isLoading.value = false;
    }
  }

  void addCategories(int idCategoryTask, String categoryDescription) async {
    try {
      isLoading.value = true;

      CategoriesModel newCategorie = CategoriesModel(
        idCategoryTask: '',
        categoryDescription: categoryDescription,
      );

      final saveResponse = await _categorieService.saveCategory(newCategorie);

      if (saveResponse) {
        fetchCategories();
      } else {
        Get.snackbar('Erro', 'Ocorreu um erro ao salvar a categoria da tarefa');
      }
    } catch (e) {
      Get.snackbar('Erro', 'Ocorreu um erro ao salvar a categoria da tarefa');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }
}
