import 'package:practice_flutter/infrastructure/todo_api_client.dart';
import 'package:practice_flutter/model/todo.dart';

class TodoRepository{
  TodoRepository({required this.apiClient});
  final TodoApiClient apiClient;

  Future<List<Todo>> fetchTodos() async{
    return apiClient.fetchTodos();
  }

  Future<Todo> createTodo(Todo todo) async{
    return apiClient.createTodo(todo);
  }

  Future<Todo> updateTodo(Todo todo) async{
    return apiClient.updateTodo(todo);
  }

  Future<void> deleteTodoById(int id) async{
    return apiClient.deleteTodoById(id);
  }
}

