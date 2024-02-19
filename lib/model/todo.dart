class Todo {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;

  Todo(
      {required this.id,
      required this.title,
      required this.description,
      this.isCompleted = false});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      isCompleted: json['isCompleted'] as bool,
    );
  }

  // TodoインスタンスをMapに変換
  Map<String, dynamic> toJsonForCreate() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}
