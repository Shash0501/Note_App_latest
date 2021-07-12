import 'package:flutter/material.dart';
//import hive
import 'package:hive/hive.dart';
import 'package:note_app_latest/models/note.dart';
import 'package:note_app_latest/widgets/list_card_note.dart';
//import path_provider as path_provider
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:note_app_latest/widgets/Add_dialog_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void dispose() {
    // TODO: implement dispose
    Hive.box("notes").close();
    super.dispose();
  }

  final notesbox = Hive.box("notes");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: notesbox.length,
            itemBuilder: (BuildContext context, int index) {
              final note_frombox = notesbox.getAt(index) as notes;
              return note_tile(note1: note_frombox);
              //return Text("loading");
            }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            print("hello friends");
            return showDialog(
                context: context,
                builder: (context) {
                  return Dialog_box();
                });
          }),
    );
  }
}
