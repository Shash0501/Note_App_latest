import 'package:flutter/material.dart';
import 'package:note_app_latest/screens/Homepage.dart';

class todo_page extends StatefulWidget {
  const todo_page({Key? key}) : super(key: key);

  @override
  _todo_pageState createState() => _todo_pageState();
}

class _todo_pageState extends State<todo_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TODO",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
            letterSpacing: 2.0,
          ),
        ),
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
                      backgroundImage: AssetImage("assets/account_image.jpg"),
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
              },
            ),
            Divider(), // add a line
            ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.settings),
                ),
                title: Text("Settings"))
          ],
        ),
      ),
    );
  }
}
