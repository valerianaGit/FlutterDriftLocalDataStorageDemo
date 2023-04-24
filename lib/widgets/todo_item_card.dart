// Card widet that will be used in the todolist list view to represent each todo item in the list
import 'package:flutter/material.dart';
import 'package:demo_drift_package/constants/constants.dart';

class TodoItemCard extends StatelessWidget {
  final String content;

  const TodoItemCard({super.key, required this.content});
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5.0,
          color: kdarkColor,
          child: Text(content,
          style: kTodoItemCardStyle,
            ),
        ),
        ),
    );
  }
}
