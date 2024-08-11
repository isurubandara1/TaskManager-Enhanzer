// lib/widgets/task_item.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../view_models/task_view_model.dart';
import '../views/edit_task_screen.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: const TextStyle(fontSize: 19),
      ),
      subtitle: Text(
        task.description,
        style: const TextStyle(
          fontSize: 13,
          fontStyle: FontStyle.italic,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditTaskScreen(task: task),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<TaskViewModel>(context, listen: false)
                  .deleteTask(task.id!);
            },
          ),
        ],
      ),
    );
  }
}
