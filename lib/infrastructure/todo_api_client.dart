import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/todo.dart';

class TodoApiClient {
  final baseUrl = 'https://jsonplaceholder.typicode.com/todos';
  // Future://Promise
  Future<List<Todo>> fetchTodos() async{
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200){
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((todo) => Todo.fromJson(todo)).toList();
    }else{
        throw Exception('Failed to load todos');
    }
  }
}

