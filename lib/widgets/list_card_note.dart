import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app_latest/providers/note_tile.dart';
import 'package:note_app_latest/models/note.dart';
import 'package:provider/provider.dart';

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
                  flex: 5,
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
                      Text("${note1.description}"),
                      Text("${note1.date}"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            data.delete_note(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                        ),
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
