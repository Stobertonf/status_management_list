import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class HomeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      String title = titleController.text;
      String description = descriptionController.text;

      try {
        final TaskObject = ParseObject('Task')
          ..set('title', title)
          ..set('description', description);

        await TaskObject.save();

        // Tarefa salva com sucesso
        Get.snackbar(
          'Success',
          'Task saved successfully.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        // Ocorreu um erro ao salvar a tarefa
        Get.snackbar(
          'Error',
          'Failed to save task.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
