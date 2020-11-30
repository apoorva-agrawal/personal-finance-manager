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
      duration: Duration(seconds: 3),
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
    return ListView.builder(
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
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(5),
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
              title: Text(
                expenses[index].tranName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(expenses[index].date),
              trailing: Text(
                expenses[index].amount,
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ),
            ),
          );
        });
  }
}
