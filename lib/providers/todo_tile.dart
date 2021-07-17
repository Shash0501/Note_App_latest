import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:note_app_latest/models/todo.dart';
import 'package:provider/provider.dart';

class Todo_tile extends ChangeNotifier {
  final todos_box = Hive.box("todos");
  void add_todo() {
    print("HEllo");
    notifyListeners();
  }

  void edit_todo(int index, todos note) {
    todos_box.putAt(index, note);
    notifyListeners();
  }

  void delete_note(index) {
    todos_box.deleteAt(index);
    notifyListeners();
  }
}
