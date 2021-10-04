import 'package:apiintegration/api.dart';
import 'package:flutter/material.dart';
import 'api.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Api(),
      ),
    );
  }
}