// Mocks generated by Mockito 5.4.4 from annotations
// in practice_flutter/test/todo_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:practice_flutter/model/todo.dart' as _i3;
import 'package:practice_flutter/repository/todo_repository.dart' as _i4;
import 'package:practice_flutter/view_model/todo_view_model.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [TodoViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoViewModel extends _i1.Mock implements _i2.TodoViewModel {
  MockTodoViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i3.Todo> get todos => (super.noSuchMethod(
        Invocation.getter(#todos),
        returnValue: <_i3.Todo>[],
      ) as List<_i3.Todo>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void update(_i4.TodoRepository? repository) => super.noSuchMethod(
        Invocation.method(
          #update,
          [repository],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<void> fetchTodos() => (super.noSuchMethod(
        Invocation.method(
          #fetchTodos,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  void addListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}