import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:note_app_latest/models/note.dart';
import 'package:provider/provider.dart';

class Note_tile extends ChangeNotifier {
  final notesbox = Hive.box("notes");
  void add_note() {
    print("HEllo");
    notifyListeners();
  }

//int index, notes note
  void edit_note(int index, notes note) {
    notesbox.putAt(index, note);
    notifyListeners();
  }

  // void note_todo(int index, notes note) {
  //   notesbox.putAt(index, note);
  //   notifyListeners();
  // }

  void delete_note(index) {
    notesbox.deleteAt(index);
    notifyListeners();
  }
}
