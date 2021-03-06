import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app_latest/providers/note_tile.dart';
import 'package:note_app_latest/models/note.dart';
import 'package:note_app_latest/screens/Note_Screen.dart';
import 'package:provider/provider.dart';

import 'edit_note_dialog_box.dart';

class note_tile extends StatefulWidget {
  late notes note1;
  late int index;
  note_tile({required this.note1, required this.index});

  @override
  _note_tileState createState() => _note_tileState(note1: note1, index: index);
}

class _note_tileState extends State<note_tile> {
  late notes note1;
  late int index;
  _note_tileState({required this.note1, required this.index});
  @override
  Widget build(BuildContext context) {
    String temp = (note1.description.length > 25)
        ? note1.description.substring(0, 25) + '...'
        : note1.description;

    return Consumer<Note_tile>(builder: (context, data, _) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.blue],
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
                                title: note1.title,
                                description: note1.description,
                                date: note1.date)),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${note1.title}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text("${temp}"),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text("${note1.date}"),
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
                        IconButton(
                          onPressed: () {
                            data.delete_note(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                        IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () async {
                              return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Edit_Dialog_box(this.index);
                                  });
                            }),
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
