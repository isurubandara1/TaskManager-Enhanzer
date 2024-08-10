class Task {
  int? id;
  String title;
  String description;

  Task({this.id, required this.title, required this.description});

  // Convert a Task into a Map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  // Convert a Map into a Task.
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }
}
