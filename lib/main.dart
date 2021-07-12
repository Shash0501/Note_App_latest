import 'package:flutter/material.dart';
//import hive
import 'package:hive/hive.dart';
//import path_provider as path_provider
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:note_app_latest/widgets/Add_dialog_box.dart';
import 'package:note_app_latest/screens/Homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  runApp(MaterialApp(
    title: 'Flutter Material',
    home: FutureBuilder(
      future: Hive.openBox("notes"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError)
            return Text("Error: +${snapshot.error}");
          else
            return MyHomePage();
        } else
          return CircularProgressIndicator();
      },
    ),
    theme: ThemeData(brightness: Brightness.dark),
  ));
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     Hive.box("notes").close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Text("HELLO"),
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () async {
//             print("hello friends");
//             return showDialog(
//                 context: context,
//                 builder: (context) {
//                   return Dialog_box();
//                 });
//           }),
//     );
//   }
// }
