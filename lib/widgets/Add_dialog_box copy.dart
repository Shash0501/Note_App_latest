import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app_latest/models/todo.dart';
import 'package:note_app_latest/screens/Homepage.dart';
import 'package:note_app_latest/providers/todo_tile.dart';
import 'package:provider/provider.dart';

class Dialog_box_todo extends StatefulWidget {
  Dialog_box_todo({Key? key}) : super(key: key);

  @override
  _Dialog_box_todoState createState() => _Dialog_box_todoState();
}

class _Dialog_box_todoState extends State<Dialog_box_todo> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final notesbox = Hive.box("todos");
  todos note1 =
      todos(title: "Sample Note", description: "This is a sample note");
  @override
  Widget build(BuildContext context) {
    final TextEditingController Note_title = TextEditingController();
    final TextEditingController Note_description = TextEditingController();

    return Consumer<Todo_tile>(builder: (context, data, _) {
      return Container(
          child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        title: Text("ADD"),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: Note_title,
                validator: (value) {
                  return value!.isNotEmpty ? null : "INVALID FIELD";
                },
                decoration:
                    InputDecoration(hintText: "Enter title of the note"),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                controller: Note_description,
                validator: (value) {
                  return value!.isNotEmpty ? null : "INVALID FIELD";
                },
                decoration:
                    InputDecoration(hintText: "Enter description of note"),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () => {
                    setState(() {
                      if (true) {
                        todos n1 = todos(
                            title: Note_title.text,
                            description: Note_description.text);
                        notesbox.add(n1);
                        data.add_todo();
                        Navigator.pop(context);
                      }
                    })
                  },
              child: Text("ADD")),
          TextButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              child: Text("CANCEL"))
        ],
      ));
    });
  }
}
