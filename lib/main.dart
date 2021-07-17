import 'package:flutter/material.dart';
//import hive

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app_latest/models/note.dart';
import 'package:note_app_latest/models/todo.dart';
import 'package:note_app_latest/providers/note_tile.dart';
import 'package:note_app_latest/providers/todo_tile.dart';
import 'package:note_app_latest/screens/splash_screen.dart';
import 'package:note_app_latest/screens/todo_page.dart';
//import path_provider as path_provider
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:note_app_latest/screens/Homepage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Hive.registerAdapter(todosAdapter());
  Hive.registerAdapter(notesAdapter());

  await Hive.openBox("notes");
  await Hive.openBox("todos");

  //await Hive.openBox("todo");

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Note_tile>(create: (context) => Note_tile()),
      ChangeNotifierProvider<Todo_tile>(create: (context) => Todo_tile()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
      ),

      //theme: ThemeData(brightness: Brightness.dark),
    ),
  ));
}
