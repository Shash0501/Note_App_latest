import 'package:flutter/material.dart';
//import hive
import 'package:hive/hive.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("HELLO"),
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
