import 'package:demo_drift_package/data/drift_db.dart';
import 'package:flutter/material.dart';
import 'package:demo_drift_package/main.dart';
import 'package:demo_drift_package/constants/strings.dart';
import 'package:demo_drift_package/constants/constants.dart';
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
              // TEXTFIELD to enter todo item
              // TODO: Share Tutorial for wrap around text
              //TODO: Share tutorial on using chose widget , between a textfield and a textview , like in letter to santa (letter_screen)
              Expanded(
                child: TextField(
                  //wrap textfield in Expanded widget + maxlines null == scrollable
                  controller:
                      txtController, // need a controller to clear textfield once we use the save button
                  maxLines: null, //wrap text
                  autofocus: true,
                  autocorrect: true,
                  cursorColor: kCursorColor,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: kAppTitle,
                  ),
                  //TODO: There might be something better to use rather than onchanged?
                  onChanged: (newValue) {
                    newContent = newValue;
                  },
                ),
              ),
              // CHECK DATABASE BUTTON
              // DELETE this button for deployment
              // ElevatedButton(
              //   child: const Text('Check database'),
              //   onPressed: () {
              //     //TODO: Update info to check database without a dedicated viewer
              //     // can you use this just for drift
              //     // or can we use it to read any sql database right from the emulator or device?
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => DriftDbViewer(database)));
              //   },
              // ),

              // LISTVIEW - vertical scroll, contains todo items
              Expanded( 
             
                //Use listview.builder to create children lazily , as necessary, 
                // this is why list is not updating 
             
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: todoList, //TODO: CREATE WIDGET
                    // MAKE ALL CODE HERE, AND
                    //IF it were a a project-> extract into its own widget file
                    //TODO: COPY LIST VIEW LETTERS(LETTERS TO SANTA) TO USE CRUD FOR DEMO
                  ),
                
              ),
            ],
          ),
        ),
      ),
      // FLOATING ACTION BUTTON IN SCAFFOLD
      //- save text input and update listView
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () {
            // Save TEXTFIELD INPUT into database AND update tableview

            // Append value of newContent to list
            print(newContent);
            //TODO: UPDATE TO WORK   todoList.add(TodoItemCard(content: newContent));
            _saveButtonAction(context, database);
            //print(todoList);
            // Clear textfield
            txtController.clear();

            //from letters to santa -  save button action with -> letter_screen.dart
          }),
    );
  }

  void _saveButtonAction(BuildContext context, TodoDatabase database) { //private method, can only be used inside the class
    database.insertNewCompanionTodo(TodosCompanion(content: Value(newContent)));
  }
}
