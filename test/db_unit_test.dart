// import 'package:drift/native.dart'; // test drift db
// import 'package:flutter/material.dart';
// import 'package:test/test.dart'; // test flutter package
import 'package:flutter_test/flutter_test.dart'; // needed to use TestWidgetsFlutterBinding.ensureInitialized(), to ensure initialized bindings
import 'package:demo_drift_package/data/drift_db.dart'; // db file we are testing

//To run tests, use command [flutter test test/<file name>] on terminal from root of project
// i.e. command [ flutter test test/db_unit_test.dart ]

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late TodoDatabase database; // late is used for null safety,
  //because of the setup/teardown lifecycle,
  //late should be safe here since tests
  //should always run setup before teardown,
  //thus ensuring that database is assigned
  //before tearDown is run

  setUp(() {
    database =
        TodoDatabase(); //NativeDatabase.memory() -> create database in memory and does not save to disk
  });

  tearDown(() async {
    await database.close();
  });

  //CREATE
  test('todos can be created', () async {
    final id = await database
        .insertNewTodo(const Todo(id: 1, content: 'todo number 1'));
    final todo = await database.watchTodoWithId(id).first;
    expect(todo.content, 'todo number 1');
  });

//READ
  test('todos can be read', () async {
    final todoList = await database.getAllTodos();
    expect(todoList, [const Todo(id: 1, content: 'todo number 1')]);
  });

  //UPDATE
  // did not use an update feature on app, but can test it can be done with written queries
  // might be a good idea to update based on ids
  test('todos can be updated', () async {
    final updateTodo = await database
        .updateNewTodo(const Todo(id: 1, content: 'todo number 1 updated'));
    final todoList = await database.getAllTodos();
    final match = [const Todo(id: 1, content: 'todo number 1 updated')];

    expect(todoList, match);
  });

  //DELETE

  test('todos can be deleted', () async {
    await database
        .deleteTodo(const Todo(id: 1, content: 'todo number 1 updated'));

    final todoList = await database.getAllTodos();
    final match = [];
    expect(todoList, match);
  });
}
