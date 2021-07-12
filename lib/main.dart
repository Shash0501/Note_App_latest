import 'package:flutter/material.dart';
//import hive
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:note_app_latest/models/note.dart';
//import path_provider as path_provider
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:note_app_latest/screens/Homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Hive.registerAdapter(notesAdapter());
  await Hive.openBox("notes");
  runApp(MaterialApp(
    home: MyHomePage(),
    theme: ThemeData(brightness: Brightness.dark),
  ));
}
