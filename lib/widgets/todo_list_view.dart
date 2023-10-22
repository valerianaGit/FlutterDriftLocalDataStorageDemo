import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // use riverpod for state management
import 'package:demo_drift_package/main.dart'; // access dbProvider
import 'package:demo_drift_package/widgets/todo_item_card.dart'; // use card widget
import 'package:demo_drift_package/data/drift_db.dart'; // Use CRUD Queries  and database
import 'package:flutter_slidable/flutter_slidable.dart'; //  package used to slide todo items to delete them

class TodoListView extends ConsumerStatefulWidget {
  const TodoListView({super.key});

  @override
  TodoListViewState createState() => TodoListViewState();
}

class TodoListViewState extends ConsumerState<TodoListView> {
  @override
  Widget build(BuildContext context) {
    final database = ref.watch(todoDBProvider);
 
// watch all posts in db 
    Stream<List<Todo>> todos =
        database.watchAllTodos();

//STEP 3 - USE STREAM BUILDER, to be able to update list and get most up to date info, StreamProvider is a better option for scalability but for the purposes of this demo, builder works well
    return StreamBuilder(
//STEP 3.A . PASS THE STREAM LIST FROM DATABASE
        stream: todos,
//STEP 3.B . PASS A BUILD CONTEXT ,
        //SNAPSHOT IS THE DATA (OR LACK THEREOFF, if no data is present, handle this case below)
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
//STEP 4 - CONSUME DATA AND HANDLE NULL VALUES / ERRORS ETC.
          return ListView.builder(
            itemBuilder: (context, index) {
//STEP4.A - IF WE GET DATA
              if (snapshot.hasData) {
                return Slidable(
                  // Specify a key if the Slidable is dismissible.
                  key: const ValueKey(0),
                  // The start action pane is the one at the left or the top side.
                  endActionPane: ActionPane(
                    // A motion is a widget used to control how the pane animates.
                    motion: const StretchMotion(),

                    // All actions are defined in the children parameter.
                    children: [
                      // A SlidableAction can have an icon and/or a label.
                      SlidableAction(
                        onPressed: (context) => deleteTodo(
                            context,
                            database,
                            snapshot
                                .data![index]), // note function call, GOTCHA!
                        autoClose: true,
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: TodoItemCard(
                    //MARK: 🚨 USING THE BANG OPERATOR HERE IS SAFE ENOUGH BECAUSE WE CHECK IF SNAPSHOT HAS DATA
                    // THE BANG OPERATOR IS FORCE UNWRAPPING, VERY DANGEROUS TO USE IN MOST CONDITIONS
                    content: snapshot.data![index].content ?? 'No data today',
                  
                  ),
                );
//STEP4.B - IF WE GET ERROR
              } else if (snapshot.hasError) {
                return TodoItemCard(
                  content: '🚨 Error: ${snapshot.error}',
                );
//STEP4.C - IF WE ARE IDLE
              } else {
                return const TodoItemCard(
                  content: 'Loading...', 
                );
              }
            },
            itemCount: snapshot
                .data?.length, //how to access the number of entries in database
          );
        });
  }

  void deleteTodo(BuildContext context, TodoDatabase database, Todo todo) {
// USE DELETE METHOD
    database.deleteTodo(todo);
  }
}
