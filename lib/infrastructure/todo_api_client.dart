import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/todo.dart';

class TodoApiClient {
  final baseUrl = 'http://localhost:8080/';
  // Future://Promise
  Future<List<Todo>> fetchTodos() async {
  final response = await http.get(Uri.parse(baseUrl + 'todos'));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
    final todosData = jsonResponse['data'] as List<dynamic>? ?? [];
    return todosData.map((todoJson) => Todo.fromJson(todoJson as Map<String, dynamic>)).toList();
  } else {
    throw Exception('Failed to load todos');
  }
}

  

  Future<Todo> createTodo(Todo todo) async {
  final response = await http.post(
    Uri.parse(baseUrl + 'todos'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(todo.toJsonForCreate()),
  );
  if (response.statusCode == 201) {
    print('Response body: ${response.body}');
    final jsonResponse = json.decode(response.body);
    if (jsonResponse['message'] == 'success') {
      // APIの仕様に応じて、'data' キーの扱いを確認
      // 単一の Todo オブジェクトが期待される場合
      final todoData = jsonResponse['data'];
      if (todoData is Map<String, dynamic>) {
        return Todo.fromJson(todoData);
      } else {
        throw Exception('Invalid Todo data format');
      }
    } else {
      throw Exception('Failed to parse Todo data');
    }
  } else {
    throw Exception('Failed to create todo');
  }
}

  Future<Todo> updateTodo(Todo todo) async {
    final response = await http.put(
      Uri.parse(baseUrl + 'todos/${todo.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(todo),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return Todo.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to update todo');
    }
  }

  Future<void> deleteTodoById(int id) async {
    final response = await http.delete(
      Uri.parse(baseUrl + 'todos/$id'),
    );
    if (response.statusCode != 204) {
      throw Exception('Failed to delete todo');
    }
  }
}
