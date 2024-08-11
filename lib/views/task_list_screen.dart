import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/task_view_model.dart';
import 'add_task_screen.dart';
import '../widgets/task_item.dart';

class TaskListScreen extends StatelessWidget {
  final Function(bool) onThemeChanged;

  TaskListScreen({required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '𝚃𝚊𝚜𝚔 𝙼𝚊𝚗𝚊𝚐𝚎𝚛 𝙰𝚙𝚙',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/settings',
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text(
                'Task Manager',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/settings',
                );
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskViewModel.tasks.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.all(8),
                  color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                  child: TaskItem(task: taskViewModel.tasks[index]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
      ),
    );
  }
}
