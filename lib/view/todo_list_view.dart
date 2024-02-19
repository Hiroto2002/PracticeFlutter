import 'package:flutter/material.dart';
import 'package:practice_flutter/model/todo.dart';
import 'package:practice_flutter/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
        itemCount: viewModel.todos.length,
        itemBuilder: (context, index) {
          final todo = viewModel.todos[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text(todo.description),
            trailing: todo.isCompleted
                ? InkWell(
                    onTap: () {
                      // check_boxがタップされたときの処理
                      print('check_boxがタップされました');
                      // 例えば、タスクを未完了にする処理など
                    },
                    child: Icon(Icons.check_box),
                  )
                : InkWell(
                    onTap: () {
                      viewModel.deleteTodoById(todo.id);
                    },
                    child: Icon(Icons.close),
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.createTodo(Todo(
              id: 0,
              title: 'New Todo',
              description: 'This is a new todo',
              isCompleted: false));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
