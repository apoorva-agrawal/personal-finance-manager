import 'package:flutter/material.dart';
import 'package:personal_finance_manager/Home.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.forward();

    _mockCheckForSession().then((value) => _navigateToHome());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});

    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => MyHome()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          //color: HexColor("#98C1D9"),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            //alignment: Alignment.center,
            children: [
              // AnimatedBuilder(
              //   animation: _controller.view,
              //   builder: (context, child) {
              //     return Transform.rotate(
              //       angle: _controller.value * 2 * 3.14,
              //       child: child,
              //     );
              //   },
              //   child: Container(
              //     child: Image.asset(
              //       'assets/images/piggy.jpg',
              //       height: 300,
              //       width: 300,
              //     ),
              //   ),
              // ),
              AnimatedContainer(
                duration: Duration(seconds: 6),
                curve: Curves.easeIn,
                child: Image.asset(
                  'assets/images/piggy.jpg',
                  height: 300,
                  width: 300,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Shimmer.fromColors(
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          'Start Saving Now',
                          style: TextStyle(fontSize: 30.0),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                  baseColor: HexColor("#ee6c4d"),
                  highlightColor: HexColor("#E0FBFC")),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
//   double _width = 200;
//   double _height = 200;
//   var _color = Colors.lightBlue[200];

//   AnimationController _controller;

//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );
//     _controller
//         .forward(); //this starts the controller -> necessary to start the animation
//     //_controller.repeat();   this is used if you want animation
//     super.initState();
//   }
//   // for AnimationController we need vsync, and for vsync we need SingleTickerProviderStateMixin

// //   double _updateState() {
// //     setState(() {
// //       _width = 300;
// //       _height = 300;
// // //      _color = Colors.redAccent[300];
// //     });
// //   }

//   @override //what created must be destroyed too
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Animation',
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               AnimatedBuilder(
//                 animation: _controller.view,
//                 builder: (context, child) {
//                   return Transform.rotate(
//                     angle: _controller.value * 2 * 3.14,
//                     child: child,
//                   );
//                 },
//                 child: Container(
//                   width: _width,
//                   height: _height,
//                   color: _color,
//                   child: Center(
//                     child: Text(
//                       'Animation',
//                       style: Theme.of(context).textTheme.headline5,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
