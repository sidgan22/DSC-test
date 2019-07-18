import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'regPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
      home: SplashScreen(),
    );
  }
}

//shadows: [
//Shadow(
//blurRadius: 5.0,
//color: Colors.blue,
//offset: Offset(2.0, 2.0),
//),
//Shadow(
//color: Colors.purple,
//blurRadius: 5.0,
//offset: Offset(-3.0, 3.0),
//),
//],
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation,_animation3;
  Animation<Color> _animation2;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3500),
    );
    _animation3 = Tween(
      begin:200.0,
      end:400.0,
    ).animate(_controller);
    _animation = Tween(
        begin: 0.0,
        end: 1.0).animate(_controller);
    _animation2=ColorTween(
        begin: Colors.lightBlue[300],
        end: Colors.deepPurple[600],
    ).animate(_controller)..addListener((){setState(() {});});

    _controller.forward();
    Timer(Duration(seconds:4),() => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => regPage()),
    ));
  }
  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ht=MediaQuery.of(context).size.height/3;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.grey,),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 100.0)),
                    AnimatedContainer(
                      duration: Duration(seconds: 3),
                      height: _animation3.value,
                      width: _animation3.value,
                      child:
                      Image.asset("assets/splash.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top:20.0),
                      ),
                      FadeTransition(
                        opacity: _animation,
                        child:
                        Container(
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("DSC@AMRITA",style: TextStyle(color: _animation2.value,fontWeight: FontWeight.bold,fontSize: 52.0,
                                ),textAlign: TextAlign.center,)
                              ],

                            )
                        ),
                      ),
                    ],
                  ),
                  ),
              Expanded(
              flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30.0),
                    ),
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    Text("LOADING",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 22.0),textAlign: TextAlign.center,),
                  ],
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}
