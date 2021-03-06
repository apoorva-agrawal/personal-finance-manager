import 'dart:async';

import 'package:flutter/material.dart';
import 'package:personal_finance_manager/Home.dart';
//import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => new MyHome(),
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    Timer(Duration(seconds: 6), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    print('Inside navigation');
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => MyHome()));
    Navigator.of(context).pushNamed('/home');
  }

  Tween<double> _scaleTween = Tween<double>(begin: 0, end: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 220,
            ),
            TweenAnimationBuilder(
              tween: _scaleTween,
              duration: Duration(milliseconds: 800),
              builder: (context, scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: child,
                );
              },
              child: Container(
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    'assets/images/piggy.jpg',
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            AnimatedContainer(
              alignment: Alignment.bottomCenter,
              height: 50,
              width: 140,
              child: Text('Start saving now!'),
              duration: Duration(milliseconds: 600),
              curve: Curves.bounceIn,
            ),
          ],
        ),
      ),
    );
  }
}
