import 'package:flutter/material.dart';
import 'package:status_management_list/app/pages/home/home_page.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text("Tarefas"),
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
            leading: const Icon(Icons.chat),
            title: const Text("Chat"),
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
            leading: const Icon(Icons.bug_report),
            title: const Text("Tasks"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
