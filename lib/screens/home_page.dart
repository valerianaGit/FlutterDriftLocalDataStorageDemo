import 'package:demo_drift_package/data/drift_db.dart';
import 'package:flutter/material.dart';
import 'package:demo_drift_package/main.dart';
import 'package:demo_drift_package/constants/strings.dart';
import 'package:demo_drift_package/widgets/todo_list_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:drift/drift.dart' hide Column; // necessary to use Value, to store new todos

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  String newContent = ''; // textfield content
  var txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final database = ref.watch(todoDBProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Expanded(
                child: TextField(
//wrap textfield in Expanded widget + maxlines null == scrollable
                  controller:
                      txtController, // need a controller to clear textfield once we use the save button
                  maxLines: null, //wrap text
                  autofocus: true,
                  autocorrect: true,
                  decoration: const InputDecoration(
                     labelText: kAppTitle,
                   ),
//MARK: There might be something better to use rather than onchanged, 
//like onSubmitted and get this async, but for simplicity we are going with onChanged
                  onChanged: (newValue) {
                    newContent = newValue;
                  },
                ),
              ),
// CHECK DATABASE BUTTON
// MARK: DELETE this button for deployment
              ElevatedButton(
                child: const Text('Check database'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DriftDbViewer(database)));
                },
              ),
const SizedBox(height: 32.0,),
              const Expanded(
                child: TodoListView(),
              ),
            ],
          ),
        ),
      ),
//- save text input and update listView
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () {
            _saveButtonAction(context, database);
            // Clear textfield
            txtController.clear();
          }),
    );
  }

  void _saveButtonAction(BuildContext context, TodoDatabase database) { //private method, can only be used inside the class
    database.insertNewCompanionTodo(TodosCompanion(content: Value(newContent)));
  }
}
