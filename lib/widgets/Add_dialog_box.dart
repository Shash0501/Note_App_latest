import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app_latest/models/note.dart';
import 'package:note_app_latest/screens/Homepage.dart';
import 'package:note_app_latest/providers/note_tile.dart';
import 'package:provider/provider.dart';

class Dialog_box extends StatefulWidget {
  Dialog_box({Key? key}) : super(key: key);

  @override
  _Dialog_boxState createState() => _Dialog_boxState();
}

class _Dialog_boxState extends State<Dialog_box> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final notesbox = Hive.box("notes");
  notes note1 =
      notes(title: "Sample Note", description: "This is a sample note");
  @override
  Widget build(BuildContext context) {
    final TextEditingController Note_title = TextEditingController();
    final TextEditingController Note_description = TextEditingController();

    return Consumer<Note_tile>(builder: (context, data, _) {
      return Container(
          child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        title: Text("Edit"),
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
                        notes n1 = notes(
                            title: Note_title.text,
                            description: Note_description.text);
                        notesbox.add(n1);
                        data.add_note();
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
