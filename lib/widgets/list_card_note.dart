import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app_latest/models/note.dart';

class note_tile extends StatefulWidget {
  late notes note1;
  note_tile({required this.note1});

  @override
  _note_tileState createState() => _note_tileState(note1: note1);
}

class _note_tileState extends State<note_tile> {
  late notes note1;
  _note_tileState({required this.note1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.red],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text("${note1.title}"),
              Text("${note1.description}"),
              Text("${note1.date}"),
            ],
          ),
        ),
      ),
    );
  }
}
