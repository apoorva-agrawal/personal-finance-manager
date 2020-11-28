import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:personal_finance_manager/widgets/expenses.dart';
import 'package:personal_finance_manager/widgets/navigationBar.dart';
import 'modal.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  double _width = double.infinity;
  double _height = 0.0;

  double _updateState() {
    setState(() {
      _width = double.infinity;
      _height = 600;
    });
  }

  @override
  void initState() {
    _updateState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#98C1D9'),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: HexColor('#98C1D9'),
          ),
          AnimatedContainer(
            height: _height,
            width: _width,
            color: Colors.white,
            curve: Curves.bounceOut,
            duration: Duration(seconds: 2),
            child: ExpenseHistory(),
          ),
          NavigationBar(),
        ],
      ),
    );
  }
}
