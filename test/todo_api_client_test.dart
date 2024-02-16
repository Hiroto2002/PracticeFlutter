import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:practice_flutter/model/todo.dart';

import 'mocks/todo_api_client_test.mocks.dart';
void main() {
  late MockTodoApiClient mockTodoApiClient;

  setUp(() {
    mockTodoApiClient = MockTodoApiClient();
  });

  test('fetchTodos returns a list of Todo', () async {
    // モックの設定
    when(mockTodoApiClient.fetchTodos()).thenAnswer((_) async => [
          Todo(id: 1, title: 'Test Todo', description: 'This is a test', isCompleted: false),
        ]);

    // モックを使用したfetchTodosのテスト
    var todos = await mockTodoApiClient.fetchTodos();
    expect(todos.isNotEmpty, true);
    expect(todos[0].title, 'Test Todo');
  });
}
