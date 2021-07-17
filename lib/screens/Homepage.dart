import 'package:flutter/material.dart';
//import hive
import 'package:hive/hive.dart';
import 'package:note_app_latest/models/note.dart';
import 'package:note_app_latest/providers/note_tile.dart';
import 'package:note_app_latest/screens/todo_page.dart';
import 'package:note_app_latest/widgets/list_card_note.dart';
//import path_provider as path_provider
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:note_app_latest/widgets/Add_dialog_box.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void dispose() {
    // TODO: implement dispose
    //Hive.box("notes").close();
    super.dispose();
  }

  final notesbox = Hive.box("notes");
  @override
  Widget build(BuildContext context) {
    return Consumer<Note_tile>(
      builder: (context, data, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('NOTES',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0)),
          ),
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: UserAccountsDrawerHeader(
                        accountEmail: Text("sm@gmail.com"),
                        accountName: Text("Shashank"),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/account_image.jpg"),
                        ),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.assignment),
                  ),
                  title: Text('NOTES'),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MyHomePage()));
                  },
                ),
                Divider(), // add a line
                ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.check_box_outlined),
                    ),
                    title: Text('TODO'),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => todo_page(
                                    Status1: 0,
                                  )));
                    }),
                Divider(), // add a line
                ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.settings),
                    ),
                    title: Text("Settings"))
              ],
            ),
          ),
          body: SafeArea(
            child: ListView.builder(
                itemCount: notesbox.length,
                itemBuilder: (BuildContext context, int index) {
                  final note_frombox = notesbox.getAt(index) as notes;
                  return note_tile(note1: note_frombox, index: index);
                  //return Text("loading");
                }),
          ),
          floatingActionButton: FloatingActionButton(
              //floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
              child: Icon(Icons.add),
              onPressed: () async {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog_box();
                    });
              }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
