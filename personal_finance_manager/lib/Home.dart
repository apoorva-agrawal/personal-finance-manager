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
  int _selectedIndex = 0;
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: HexColor('#98C1D9'),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'debts',
              icon: IconButton(
                  icon: Icon(Icons.home),
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
        ],
      ),
    );
  }
}
