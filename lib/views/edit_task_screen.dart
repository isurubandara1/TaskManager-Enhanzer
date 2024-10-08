import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/task_view_model.dart';
import '../models/task.dart';

class EditTaskScreen extends StatelessWidget {
  final Task task;

  EditTaskScreen({required this.task});

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = task.title;
    _descriptionController.text = task.description;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text(
          'Update Task',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 4,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final title = _titleController.text;
                  final description = _descriptionController.text;

                  if (title.isNotEmpty && description.isNotEmpty) {
                    final updatedTask = Task(
                      id: task.id,
                      title: title,
                      description: description,
                    );
                    Provider.of<TaskViewModel>(context, listen: false)
                        .updateTask(updatedTask);
                    Navigator.pop(context);
                  }
                },
                child: Text('Update Task'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  onPrimary: Colors.black,
                  minimumSize: Size(200, 50),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/update.png',
                width: 200,
                height: 400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
