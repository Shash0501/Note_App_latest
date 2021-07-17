import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app_latest/providers/todo_tile.dart';
import 'package:note_app_latest/models/todo.dart';
import 'package:note_app_latest/screens/Note_Screen.dart';
import 'package:provider/provider.dart';

import 'edit_note_dialog_box.dart';

class todo_tile extends StatefulWidget {
  late todos todo1;
  late int index;
  todo_tile({required this.todo1, required this.index});

  @override
  _todo_tileState createState() => _todo_tileState(todo1: todo1, index: index);
}

class _todo_tileState extends State<todo_tile> {
  late todos todo1;
  late int index;
  final todosbox = Hive.box("todos");
  _todo_tileState({required this.todo1, required this.index});
  @override
  Widget build(BuildContext context) {
    String temp = (todo1.description.length > 25)
        ? todo1.description.substring(0, 25) + '...'
        : todo1.description;

    return Consumer<Todo_tile>(builder: (context, data, _) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orangeAccent, Colors.deepOrangeAccent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => note_screen(
                                title: todo1.title,
                                description: todo1.description,
                                date: todo1.date)),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${todo1.title}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(temp, style: TextStyle(color: Colors.black)),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text("${todo1.date}",
                            style: TextStyle(color: Colors.black)),
                        //Text("${todo1.status}"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 20.0,
                          child: IconButton(
                            onPressed: () {
                              data.delete_note(index);
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ),
                        VerticalDivider(
                          width: 5.0,
                          thickness: 5.0,
                          color: Colors.black,
                        ),
                        CircleAvatar(
                          radius: 21,
                          child: IconButton(
                              icon: Icon(
                                Icons.check,
                                color: todo1.status ? Colors.green : Colors.red,
                              ),
                              onPressed: () {
                                todo1.status = !todo1.status;
                                todosbox.putAt(index, todo1);
                                data.add_todo();
                              }),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
