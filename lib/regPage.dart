import 'package:flutter/material.dart';
import 'RegisterForm.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    backgroundColor: Colors.lightBlueAccent,
    accentColor: Colors.redAccent,
    primaryColor: Colors.redAccent,
    brightness: Brightness.light,
  ),
  home: regPage(),
));

class regPage extends StatefulWidget {
  @override
  _regPageState createState() => _regPageState();
}

class _regPageState extends State<regPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: RegisterForm(),
        ),
      ),
    );

  }
}
