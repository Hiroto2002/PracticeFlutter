import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:practice_flutter/model/todo.dart';
import 'package:practice_flutter/view/todo_list_view.dart';
import 'package:practice_flutter/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

import 'mocks/todo_view_model_test.mocks.dart';

// モッククラスの生成を指示
@GenerateMocks([TodoViewModel])
void main() {
  late MockTodoViewModel mockTodoViewModel;

  setUp(() {
    // TodoViewModelのモックを初期化
    mockTodoViewModel = MockTodoViewModel();
  });

  testWidgets('TodoListView displays list items from ViewModel', (WidgetTester tester) async {
    // モックの設定: TodoViewModelが提供するモックデータを設定
    when(mockTodoViewModel.todos).thenReturn([
      Todo(id: 1, title: 'Test Todo 1', description: 'Description 1', isCompleted: false),
      Todo(id: 2, title: 'Test Todo 2', description: 'Description 2', isCompleted: true),
    ]);

    // モックをプロバイダーとして提供し、TodoListViewをビルド
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<TodoViewModel>(
          create: (context) => mockTodoViewModel,
          child: TodoListView(),
        ),
      ),
    );

    // モックデータに基づいて、特定のテキストが表示されていることを確認
    expect(find.text('Test Todo 1'), findsOneWidget);
    expect(find.text('Test Todo 2'), findsOneWidget);
  });
}