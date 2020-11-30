import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:personal_finance_manager/pages.dat/debt.dart';
import 'package:personal_finance_manager/widgets/expenses.dart';
import 'modal.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int _selectedIndex = 0;
  double _width = double.infinity;
  double _height = 0.0;

  double _updateState() {
    setState(() {
      _width = double.infinity;
      _height = 500;
    });
  }

  @override
  void initState() {
    _updateState();
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.forward();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#98C1D9'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'debts',
              icon: IconButton(
                  icon: Icon(Icons.attach_money_rounded),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DebtPage()),
                    );
                  })),
          BottomNavigationBarItem(
              label: 'expenses',
              icon: IconButton(
                  icon: Icon(Icons.money_off_csred_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DebtPage()),
                    );
                  })),
          BottomNavigationBarItem(
              label: 'plannar',
              icon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DebtPage()),
                    );
                  })),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: HexColor('#98C1D9'),
        onTap: _onItemTapped,
      ),
      body: Stack(
        children: [
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 2),
              end: const Offset(0, 0),
            ).animate(CurvedAnimation(
              parent: _controller,
              curve: Curves.bounceInOut,
            )),
            child: Container(
              height: double.infinity,
              width: _width,
              color: Colors.white,
              child: ExpenseHistory(),
            ),
          ),
        ],
      ),
    );
  }
}
