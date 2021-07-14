import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class Note_tile extends ChangeNotifier {
  final notesbox = Hive.box("notes");
  void add_note() {
    notifyListeners();
  }

  void delete_note(index) {
    notesbox.deleteAt(index);
    notifyListeners();
  }
}
