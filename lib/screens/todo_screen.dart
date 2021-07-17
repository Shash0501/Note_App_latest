import 'package:flutter/material.dart';
//import hive
import 'package:hive/hive.dart';
import 'package:note_app_latest/models/todo.dart';
import 'package:note_app_latest/providers/todo_tile.dart';
import 'package:note_app_latest/screens/Homepage.dart';
import 'package:note_app_latest/screens/todo_screen.dart';
import 'package:note_app_latest/widgets/Add_dialog_box%20copy.dart';
import 'package:note_app_latest/widgets/todo_card_note.dart';
//import path_provider as path_provider
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:note_app_latest/widgets/Add_dialog_box.dart';
import 'package:provider/provider.dart';

class todo_page extends StatefulWidget {
  const todo_page({Key? key}) : super(key: key);

  @override
  _todo_pageState createState() => _todo_pageState();
}

class _todo_pageState extends State<todo_page> {
  void dispose() {
    // TODO: implement dispose
    //Hive.box("notes").close();
    super.dispose();
  }

  final todosbox = Hive.box("todos");
  @override
  Widget build(BuildContext context) {
    return Consumer<Todo_tile>(
      builder: (context, data, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('TODO',
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
                              builder: (BuildContext context) => todo_page()));
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
                itemCount: todosbox.length,
                itemBuilder: (BuildContext context, int index) {
                  final note_frombox = todosbox.getAt(index) as todos;
                  return todo_tile(note1: note_frombox, index: index);
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
                      return Dialog_box_todo();
                    });
              }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
