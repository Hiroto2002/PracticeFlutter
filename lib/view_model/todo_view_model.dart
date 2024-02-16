import 'package:flutter/foundation.dart';
import 'package:practice_flutter/repository/todo_repository.dart';
import '../model/todo.dart';

class TodoViewModel extends ChangeNotifier {
  TodoRepository _repository;
  List<Todo> _todos = [];

  TodoViewModel({required TodoRepository repository}) : _repository = repository;

  List<Todo> get todos => _todos;

  // TodoRepositoryが更新されたときに呼び出されるupdateメソッド
  void update(TodoRepository repository) {
    _repository = repository;
    // 必要に応じて、repositoryの更新に関連する処理をここで行う
    // 例えば、新しいrepositoryを使ってデータを再取得する
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    try {
      _todos = await _repository.fetchTodos();
      notifyListeners(); // 変更を通知してUIを更新
    } catch (error) {
      // エラーハンドリングの処理（ログ出力、ユーザーへの通知など）
      print("Error fetching todos: $error");
    }
  }
}
