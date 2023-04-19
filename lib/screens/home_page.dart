import 'package:flutter/material.dart';
import 'package:demo_drift_package/constants/strings.dart';
import 'package:demo_drift_package/constants/constants.dart';

//TODO: use riverpod or provider for state management
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String newContent = ''; // textfield content 
  var txtController = TextEditingController();
  var todoList = <String>[]; // String array, will hold todo list items 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // TEXTFIELD to enter todo item
          // TODO: Share Tutorial for wrap around text
          //TODO: Share tutorial on using chose widget , between a textfield and a textview , like in letter to santa (letter_screen)
          Expanded(
            child: TextField(
              //wrap textfield in Expanded widget + maxlines null == scrollable
              controller: txtController, // need a controller to clear textfield once we use the save button
              maxLines: null, //wrap text
              autofocus: true,
              autocorrect: true,
              cursorColor: kCursorColor,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: kAppTitle,
              ),
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
            child: ListView(
              scrollDirection: Axis.vertical,
//TODO: BUILD TODO LIST VIEW
// MAKE ALL CODE HERE, AND
//IF it were a a project-> extract into its own widget file
//TODO: COPY LIST VIEW LETTERS(LETTERS TO SANTA) TO USE CRUD FOR DEMO
            ),
          ),
        ],
      ),
      // FLOATING ACTION BUTTON IN SCAFFOLD
      //- save text input and update listView
      floatingActionButton: FloatingActionButton(onPressed: () {
        // Save TEXTFIELD INPUT into database AND update tableview

        // Append value of newContent to list 
       todoList.add(newContent);
        
        // Clear textfield
        txtController.clear();

        //from letters to santa -  save button action with -> letter_screen.dart
    
      }),
    );
  }
}
