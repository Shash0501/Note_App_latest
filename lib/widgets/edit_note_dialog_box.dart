import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app_latest/models/note.dart';
import 'package:note_app_latest/screens/Homepage.dart';
import 'package:note_app_latest/providers/note_tile.dart';
import 'package:provider/provider.dart';

class Edit_Dialog_box extends StatefulWidget {
  int index;
  Edit_Dialog_box(this.index);
  @override
  _Edit_Dialog_boxState createState() => _Edit_Dialog_boxState(this.index);
}

class _Edit_Dialog_boxState extends State<Edit_Dialog_box> {
  int index;
  _Edit_Dialog_boxState(this.index);
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
        title: Text("EDIT"),
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
                        //notesbox.putAt(index, n1);
                        data.edit_note(index, n1);
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
