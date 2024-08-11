import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/task_view_model.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text(
          'Add Task',
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
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final title = _titleController.text;
                  final description = _descriptionController.text;

                  if (title.isNotEmpty && description.isNotEmpty) {
                    final task = Task(title: title, description: description);
                    Provider.of<TaskViewModel>(context, listen: false)
                        .addTask(task);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Task'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  onPrimary: Colors.black,
                  minimumSize: Size(200, 50),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/add.png',
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
