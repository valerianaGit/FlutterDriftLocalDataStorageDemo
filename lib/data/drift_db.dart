//STEP 1 - IMPORT drift package

import 'package:drift/drift.dart';
import 'dart:io'; // needed to generate/find a path to db
import 'package:drift/native.dart'; // needed to use NativeDatabase
import 'package:path_provider/path_provider.dart'; // needed to get path to document's directory 
//where application can place user generated data
import 'package:path/path.dart'
    as p; // needed to generate/find a path to db -> p is the name we will use in our code to join the path

// import generated file by drift
part 'drift_db.g.dart';
//STEP 2 - Create data model table

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()
      .nullable()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory(); //
    final file = File(p.join(dbFolder.path,
        'tododb.sqlite')); // create File object for our database, named tododb.sqlite
    return NativeDatabase(file,
        logStatements: true); // SET logs to true, for easier development
  });
  // GOTCHA! -> using Provider package, we would need to dispose, close db on main.dart. 
  // Dispose doesn't seem to be necessary using Riverpod having autodispose
}
//STEP 3 - Create Drift database from table

@DriftDatabase(tables: [Todos])
class TodoDatabase extends _$TodoDatabase {
//STEP 4 - Open connection to database in system

  TodoDatabase() : super(_openConnection());
  @override
  int get schemaVersion =>
      1; // strongly recomend this,
      // to be able to update to new versions of your schema, 
      // for any future changes
//STEP 5 - Run command [ flutter pub run build_runner build ] to generate .g file and create queries
  
//STEP 6 -  Create CRUD queries 
  // Queries
  // Create
  Future insertNewTodo(Todo todo) => into(todos).insert(todo);
  // Create using post companion - 
  // create post since id is an autoincrement and cannot be entered manually
  Future<int> insertNewCompanionTodo(TodosCompanion todo) =>
      into(todos).insert(todo);
  //Read
  Future<List<Todo>> getAllTodos() => select(todos).get();
  Stream<List<Todo>> watchAllTodos() => select(todos).watch(); //automatically emits new values when  we have underlying table changes
  Stream<Todo>watchTodoWithId(int id) => (select(todos)..where((u) => u.id.equals(id))).watchSingle(); // to be used for testing purposes 
  //Update
  Future updateNewTodo(Todo todo) => update(todos).replace(todo);
  //Delete
  Future deleteTodo(Todo todo) => delete(todos).delete(todo);

}

