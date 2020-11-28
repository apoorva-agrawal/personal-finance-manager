import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:personal_finance_manager/modal.dart';

class ExpenseHistory extends StatefulWidget {
  @override
  _ExpenseHistoryState createState() => _ExpenseHistoryState();
}

class _ExpenseHistoryState extends State<ExpenseHistory>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(
  //     duration: const Duration(seconds: 2),
  //   ).repeat(reverse: true);
  // }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (BuildContext cntxt, int index) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: const Offset(0, 0),
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.elasticIn,
                )),
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          height: 50,
                          width: 50,
                          child: Image(
                            image: AssetImage(expenses[index].iconUrl),
                            fit: BoxFit.contain,
                          ),
                          decoration: BoxDecoration(
                              color: HexColor('#98C1D9'),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        new Text(
                          expenses[index].tranName,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16.0),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(expenses[index].amount,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: HexColor('EE6C4D'), fontSize: 16.0)),
                            Text(expenses[index].date,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 12.0)),
                          ],
                        ),
                      ],
                    )),
              );
            }),
      ),
    );
  }
}
