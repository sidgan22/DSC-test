import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'regPage.dart';
import 'RegisterForm.dart';

void main() => runApp(disPage());
class disPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.lightBlueAccent,
        accentColor: Colors.redAccent,
        primaryColor: Colors.redAccent,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.lightBlueAccent,
        accentColor: Colors.redAccent,
        primaryColor: Colors.redAccent,
      ),
      home: DisplayPage(),
    );
  }
}

class DisplayPage extends StatefulWidget {
  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: profileInfo(),
        ),
      ),
    );
  }
}
