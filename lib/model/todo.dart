class Todo{
  final int id;
  final String title;
  final String description;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false
  });

  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted']
    );
  }
}

