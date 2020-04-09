import 'package:flutter/material.dart';
import 'Homepage.dart';
void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'tic tac toe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.purple,
      ),
      home: Homepage()
      
    );
  }
}