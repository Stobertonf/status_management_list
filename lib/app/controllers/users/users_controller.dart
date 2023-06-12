import 'package:get/get.dart';
import 'package:status_management_list/app/models/user_model.dart';
import 'package:status_management_list/app/shared/services/users/usersservice.dart';

class UsersController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<UsersModel> users = <UsersModel>[].obs;
  final UsersService _usersService = UsersService();

  void fetchUsers() async {
    try {
      isLoading.value = true;
      final response = await _usersService.fetchUsers();
      users.assignAll(response);
    } catch (e) {
      Get.snackbar('Erro', 'Ocorreu um erro ao buscar os usuários');
    } finally {
      isLoading.value = false;
    }
  }

  void addUser(
      String name, String profession, String email, String birth) async {
    try {
      isLoading.value = true;

      UsersModel newUser = UsersModel(
        idUser: '',
        name: '',
        profession: '',
        email: '',
        birth: '',
      );

      final saveResponse = await _usersService.saveUser(newUser);

      if (saveResponse) {
        fetchUsers();
      } else {
        Get.snackbar('Erro', 'Ocorreu um erro ao salvar o usuário');
      }
    } catch (e) {
      Get.snackbar('Erro', 'Ocorreu um erro ao salvar o usuário');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }
}
