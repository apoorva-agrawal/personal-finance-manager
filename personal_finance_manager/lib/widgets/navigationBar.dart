import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:personal_finance_manager/pages.dat/debt.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar({Key key}) : super(key: key);
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0',
      style: optionStyle,
    ),
    Text(
      'Index 1',
      style: optionStyle,
    ),
    Text(
      'Index 2',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'debt'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'expenses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Planner'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: HexColor('000000'),
        onTap: _onItemTapped,
      ),
    );
  }
}
