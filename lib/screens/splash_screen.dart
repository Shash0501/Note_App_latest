import 'package:flutter/material.dart';
import 'package:note_app_latest/screens/Homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void switchToScreen() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    switchToScreen();
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.grey])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.black])),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/loadingimage.gif'),
                  )),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "WELCOME",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
