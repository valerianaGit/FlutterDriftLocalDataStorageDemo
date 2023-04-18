import 'package:flutter/material.dart';

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
TextField(
  textCapitalization: TextCapitalization.words,
  onTap:() {
    //
  },
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