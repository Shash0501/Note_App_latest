import 'package:flutter/material.dart';
//import hive
import 'package:hive/hive.dart';
//import path_provider as path_provider



void main() {
  runApp(MaterialApp(
    title: 'Flutter Material',
    home: MyHomePage(),
    theme: ThemeData(brightness: Brightness.dark),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("HELLO"),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }
}
