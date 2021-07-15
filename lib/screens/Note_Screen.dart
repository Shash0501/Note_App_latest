import 'package:flutter/material.dart';

class note_screen extends StatefulWidget {
  String title;
  String description;
  String date;
  note_screen(
      {required this.date, required this.title, required this.description});
  @override
  _note_screenState createState() =>
      _note_screenState(title: title, description: description, date: date);
}

class _note_screenState extends State<note_screen> {
  String title;
  String description;
  String date;
  _note_screenState(
      {required this.date, required this.title, required this.description});
  @override
  Widget build(BuildContext context) {
    String title1 = title.length > 10 ? title.substring(0, 10) + '...' : title;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title1,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(description, style: TextStyle(fontSize: 18)),
              Divider(),
              Text(date)
            ],
          ),
        ));
  }
}
