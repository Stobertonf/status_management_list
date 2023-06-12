import 'package:get/get.dart';
import 'package:status_management_list/app/models/task_model.dart';
import 'package:status_management_list/app/shared/services/tasks/taskservice.dart';

class TaskController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<TaskModel> tasks = <TaskModel>[].obs;
  final TaskService _taskService = TaskService();

  void fetchTasks() async {
    try {
      isLoading.value = true;
      final response = await _taskService.fetchTasks();
      tasks.assignAll(response);
    } catch (e) {
      Get.snackbar('Erro', 'Ocorreu um erro ao buscar as tarefas');
    } finally {
      isLoading.value = false;
    }
  }

  void addTask(String title, String description) async {
    try {
      isLoading.value = true;

      TaskModel newTask = TaskModel(
        idTask: '',
        title: title,
        description: description,
        userId: '',
        categoryId: '',
      );

      final saveResponse = await _taskService.saveTask(newTask);

      if (saveResponse) {
        fetchTasks();
      } else {
        Get.snackbar('Erro', 'Ocorreu um erro ao salvar a tarefa');
      }
    } catch (e) {
      Get.snackbar('Erro', 'Ocorreu um erro ao salvar a tarefa');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }
}
