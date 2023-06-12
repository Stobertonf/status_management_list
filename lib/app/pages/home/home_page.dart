import 'package:flutter/material.dart';
import 'package:status_management_list/app/models/task_model.dart';
import 'package:status_management_list/app/pages/tasks/task_page.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:status_management_list/app/controllers/tasks/tasks_controller.dart';
import 'package:status_management_list/app/shared/widgets/drawer/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      drawer: const CustonDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TasksPage(),
                  ),
                );
              },
              child: const Text(
                'Criar Tarefa',
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: GetX<TaskController>(
                builder: (controller) {
                  if (controller.isLoading.value) {
                    return const CircularProgressIndicator();
                  } else if (controller.tasks.isEmpty) {
                    return const Text('No tasks found.');
                  } else {
                    return ListView.builder(
                      itemCount: controller.tasks.length,
                      itemBuilder: (context, index) {
                        TaskModel task = controller.tasks[index];
                        return ListTile(
                          title: Text(task.title),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
