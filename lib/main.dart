import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:practice_flutter/repository/todo_repository.dart';
import 'package:practice_flutter/infrastructure/todo_api_client.dart';
import 'package:practice_flutter/view_model/todo_view_model.dart';
import 'package:practice_flutter/view/todo_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TodoApiClient>(
          create: (_) => TodoApiClient(),
        ),
        ProxyProvider<TodoApiClient, TodoRepository>(
          update: (_, apiClient, __) => TodoRepository(apiClient: apiClient),
        ),
        ChangeNotifierProxyProvider<TodoRepository, TodoViewModel>(
          create: (context) => TodoViewModel(
              repository: Provider.of<TodoRepository>(context, listen: false)),
          update: (_, repository, viewModel) {
            viewModel!.update(repository);
            return viewModel;
          },
        ),
      ],
      child: MaterialApp(
        home: TodoListView(),
      ),
    );
  }
}
