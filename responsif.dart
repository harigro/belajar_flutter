import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String helloText = 'Hello, Flutter!';

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.amber[600],
            width: screenSize.width >= 600 ? 400 : 200,
            height: 400,
            child: Center(
              child: Text(
                helloText,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
