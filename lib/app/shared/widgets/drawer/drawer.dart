import 'package:flutter/material.dart';
import 'package:status_management_list/app/pages/home/home_page.dart';
import 'package:status_management_list/app/pages/tasks/task_page.dart';
import 'package:status_management_list/app/pages/users/user_page.dart';
import 'package:status_management_list/app/pages/categories/categories_page.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: UserAccountsDrawerHeader(
                accountName: const Text(
                  "stoberton.francisco",
                ),
                accountEmail: const Text(
                  "stoberton.francisco@smfsystems.com.br",
                ),
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                currentAccountPicture: SizedBox(
                  child: Image.asset(
                    'assets/images/smf_logo.png',
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.bug_report,
              ),
              title: const Text(
                "Bugs",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.category,
              ),
              title: const Text(
                "Categories",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CategoriesPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.task,
              ),
              title: const Text(
                "Tasks",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TasksPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.people,
              ),
              title: const Text(
                "Usuários",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const UserPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
