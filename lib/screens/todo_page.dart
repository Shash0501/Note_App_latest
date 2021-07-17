import 'package:flutter/material.dart';
//import hive
import 'package:hive/hive.dart';
import 'package:note_app_latest/models/todo.dart';
import 'package:note_app_latest/providers/todo_tile.dart';
import 'package:note_app_latest/screens/Homepage.dart';
import 'package:note_app_latest/screens/todo_page.dart';
import 'package:note_app_latest/widgets/Add_dialog_box%20copy.dart';
import 'package:note_app_latest/widgets/MenuItems.dart';
//import 'package:note_app_latest/widgets/menuitems.dart';
import 'package:note_app_latest/widgets/menuitems_class.dart';
import 'package:note_app_latest/widgets/todo_card_note.dart';
//import path_provider as path_provider
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:note_app_latest/widgets/Add_dialog_box.dart';
import 'package:provider/provider.dart';

class todo_page extends StatefulWidget {
  int Status1;
  todo_page({required this.Status1});
  @override
  _todo_pageState createState() => _todo_pageState(Status: Status1);
}

class _todo_pageState extends State<todo_page> {
  int Status;
  _todo_pageState({required this.Status});
  void dispose() {
    // TODO: implement dispose
    //Hive.box("notes").close();
    super.dispose();
  }

  void OnSelected(BuildContext context, MenuItem item) {
    switch (item.title) {
      case "Completed":
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => todo_page(Status1: 1)));
        break;
      case "Not Completed":
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => todo_page(Status1: 2)));
        break;
      case "All":
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => todo_page(Status1: 0)));
        break;
    }
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
        value: item,
        child: Text(item.title),
      );

  final todosbox = Hive.box("todos");
  @override
  Widget build(BuildContext context) {
    int status = Status;
    MenuItems menuitems = MenuItems();
    return Consumer<Todo_tile>(
      builder: (context, data, _) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              PopupMenuButton<MenuItem>(
                  onSelected: (item) => OnSelected(context, item),
                  itemBuilder: (context) =>
                      [...menuitems.items.map(buildItem).toList()])
            ],
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
                              builder: (BuildContext context) =>
                                  todo_page(Status1: 0)));
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
                  final todo_frombox = todosbox.getAt(index) as todos;
                  if (Status == 1) {
                    if (todo_frombox.status) {
                      print(todo_frombox.status);
                      return todo_tile(todo1: todo_frombox, index: index);
                    }
                    print("status=1\n");
                  } else if (Status == 2) {
                    if (!todo_frombox.status) {
                      return todo_tile(todo1: todo_frombox, index: index);
                    }
                  } else {
                    return todo_tile(todo1: todo_frombox, index: index);
                  }
                  //TODO:can we write this witout returning anything
                  return Container();
                  //return null;
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
