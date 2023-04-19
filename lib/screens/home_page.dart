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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: 
Column(
 children: [
  // TEXTFIELD to enter todo item
  // TODO: Share Tutorial for wrap around text 
Expanded(
  child:   TextField(
  //wrap textfield in Expanded widget + maxlines null == scrollable
    textCapitalization: TextCapitalization.words,
        controller: txtController,
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
                ElevatedButton(
                  child: const Text('Check database'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DriftDbViewer(database)
                        )
                        );
                    
                  },
                ),

    // LISTVIEW - 
    Expanded(
  child:   ListView(
    scrollDirection: Axis.vertical,
  //TODO: Add dummy pictures for this basic suite 
  ),
),
    //TODO: FLOATING ACTION BUTTON IN SCAFFOLD  

 ],
  

),

    );

  }
}