import 'package:flutter/material.dart';

class Dialog_box extends StatefulWidget {
  Dialog_box({Key? key}) : super(key: key);

  @override
  _Dialog_boxState createState() => _Dialog_boxState();
}

class _Dialog_boxState extends State<Dialog_box> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text("Edit"),
        //  content: Form(child: Bu,),
      ),
    );
  }
}
