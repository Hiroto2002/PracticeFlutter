import 'package:flutter/material.dart';
import 'package:practice_flutter/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoListView extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final viewModel = Provider.of<TodoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title:Text('Todo List')
      ),
      body: ListView.builder(
        itemCount: viewModel.todos.length,
        itemBuilder: (context, index){
          final todo = viewModel.todos[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text(todo.description),
            trailing: Icon(todo.isCompleted ? Icons.check_box : Icons.close),
          );
        },
      ),
    );
  }
}

