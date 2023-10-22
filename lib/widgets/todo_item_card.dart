// Card widet that will be used in the todolist list view to represent each todo item in the list
import 'package:flutter/material.dart';
import 'package:demo_drift_package/constants/constants.dart';

class TodoItemCard extends StatelessWidget {
  final String content;

  const TodoItemCard({super.key, required this.content});
  

  @override
  Widget build(BuildContext context) {
    return 
        SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 20.0,
            color: kdarkColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(content,
              style: kTodoItemCardStyle,
                ),
            ),
          ),
        );
  }
}
