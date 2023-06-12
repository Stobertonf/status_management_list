import 'package:status_management_list/app/models/user_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UsersService {
  Future<List<UsersModel>> fetchUsers() async {
    List<UsersModel> users = [];

    await Parse().initialize(
      '12345678910SDFASDADS',
      'ASDADSDA12365478910SDFASD',
      autoSendSessionId: true,
      debug: true,
      coreStore: await CoreStoreSharedPrefsImp.getInstance(),
    );

    final queryBuilder = QueryBuilder<ParseObject>(
      ParseObject(
        'User',
      ),
    );

    try {
      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        for (final userObject in response.results!) {
          final user = UsersModel.fromJson(userObject.toJson());
          users.add(user);
        }
      }
    } catch (e) {
      print('Erro ao buscar as tarefas: $e');
    }

    return users;
  }

  Future<bool> saveUser(UsersModel user) async {
    try {
      await Parse().initialize(
        '12345678910SDFASDADS',
        'ASDADSDA12365478910SDFASD',
        autoSendSessionId: true,
        debug: true,
        coreStore: await CoreStoreSharedPrefsImp.getInstance(),
      );

      final taskObject = ParseObject('User')
        ..set('Name', user.name)
        ..set('Profession', user.profession)
        ..set('Email', user.email)
        ..set('Birth', user.birth);

      final response = await taskObject.save();

      return response.success;
    } catch (e) {
      print('Erro ao salvar a tarefa: $e');
      return false;
    }
  }
}
