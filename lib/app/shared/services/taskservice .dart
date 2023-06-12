import 'package:status_management_list/app/models/task_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class TaskService {
  Future<List<TaskModel>> fetchTasks() async {
    List<TaskModel> tasks = [];

    await Parse().initialize(
      'PpUlIq6MlXGx7dCh2kuiodTkVZYhbny7Qr3YOdKY',
      '8jVSlnLmBKSlqsvLird8yGQPq3BRiM1ujRnyISKQ',
      autoSendSessionId: true,
      debug: true,
      coreStore: await CoreStoreSharedPrefsImp.getInstance(),
    );

    final queryBuilder = QueryBuilder<ParseObject>(
      ParseObject(
        'Task',
      ),
    );

    try {
      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        for (final taskObject in response.results!) {
          final task = TaskModel.fromJson(taskObject.toJson());
          tasks.add(task);
        }
      }
    } catch (e) {
      print('Erro ao buscar as tarefas: $e');
    }

    return tasks;
  }

  Future<bool> saveTask(TaskModel task) async {
    try {
      await Parse().initialize(
        'PpUlIq6MlXGx7dCh2kuiodTkVZYhbny7Qr3YOdKY',
        '8jVSlnLmBKSlqsvLird8yGQPq3BRiM1ujRnyISKQ',
        autoSendSessionId: true,
        debug: true,
        coreStore: await CoreStoreSharedPrefsImp.getInstance(),
      );

      final taskObject = ParseObject('Task')
        ..set('Title', task.title)
        ..set('Description', task.description)
        ..set('UserID', task.userId)
        ..set('CategoryID', task.categoryId);

      final response = await taskObject.save();

      return response.success;
    } catch (e) {
      print('Erro ao salvar a tarefa: $e');
      return false;
    }
  }
}
